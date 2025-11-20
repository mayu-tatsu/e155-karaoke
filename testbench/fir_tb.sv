// fir_tb.sv
// Testbench for 32-tap FIR filter
// Tests: impulse response, frequency response, and realistic audio signal

`timescale 1ns/1ps

module fir_tb();

    logic               clk;
    logic               reset_n;
    logic signed [15:0] x_in;
    logic               x_in_valid;
    logic signed [15:0] y_out;
    logic               y_out_valid;
    
    // clk generation (16 kHz sample rate = 62.5 us period)
    localparam CLK_PERIOD = 10;         // 100 MHz for simulation speed
    localparam SAMPLE_PERIOD = 6250;    // 62.5 us = 16 kHz sample rate
    always #(CLK_PERIOD/2) clk = ~clk;
    
    fir dut (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(x_in),
        .x_in_valid(x_in_valid),
        .y_out(y_out),
        .y_out_valid(y_out_valid)
    );
    
    localparam real SAMPLE_RATE = 16000.0;
    localparam int NUM_SAMPLES = 1024;
    
    // helper function: Convert Q15 to real
    function real q15_to_real(logic signed [15:0] val);
        return $itor(val) / 32768.0;
    endfunction
    
    // helper function: Convert real to Q15
    function logic signed [15:0] real_to_q15(real val);
        real clamped;
        clamped = (val > 0.9999) ? 0.9999 : (val < -1.0) ? -1.0 : val;
        return $rtoi(clamped * 32768.0);
    endfunction
    
    task send_sample(input logic signed [15:0] sample);
        @(posedge clk);
        x_in <= sample;
        x_in_valid <= 1'b1;
        @(posedge clk);
        x_in_valid <= 1'b0;
        // Wait for sample period (simulate 16 kHz rate)
        repeat(SAMPLE_PERIOD/CLK_PERIOD - 2) @(posedge clk);
    endtask
    
    // Task: Wait for output
    task wait_for_output(output logic signed [15:0] result);
        while (!y_out_valid) @(posedge clk);
        result = y_out;
        @(posedge clk);
    endtask
    
    // Main test sequence
    initial begin
        // Initialize
        clk = 0;
        reset_n = 0;
        x_in = 0;
        x_in_valid = 0;
        
        // Reset
        #(CLK_PERIOD*10);
        reset_n = 1;
        #(CLK_PERIOD*10);
        
        $display("FIR Filter Testbench start");
        
        // Test 1: Impulse Response
        test_impulse_response();
        
        // Test 2: DC Input (should pass through at unity gain)
        test_dc_input();
        
        // Test 3: Sine wave at 1 kHz (in passband)
        test_sine_wave(1000.0);
        
        // Test 4: Sine wave at 2 kHz (in passband)
        test_sine_wave(2000.0);
        
        // Test 5: Sine wave at 7 kHz (near Nyquist, should be attenuated)
        test_sine_wave(7000.0);
        
        // Test 6: Mixed frequency signal
        test_mixed_signal();
        
        $display("All tests completed!");
        $finish;
    end
    
    // Test 1: Impulse Response
    task test_impulse_response();
        logic signed [15:0] output_sample;
        int i;
        
        $display("\nTest 1: Impulse Response");
        
        // Send impulse (max value)
        send_sample(16'sd16384);  // 0.5 in Q15
        
        // Send zeros
        for (i = 0; i < 100; i++) begin
            send_sample(16'sd0);
            if (y_out_valid && i < 40) begin
                    $display("  h[%2d] = %f", i, q15_to_real(y_out));
            end
        end
    endtask
    
    // Test 2: DC Input
    task test_dc_input();
        // logic signed [15:0] output_sample;
        real sum, avg;
        int i, count, samples_sent;
        
        $display("\nTest 2: DC Input (Unity Gain Test)");
        
        sum = 0;
        count = 0;
		samples_sent = 0;
		
		fork
			begin
				for (i = 0; i < 100; i++) begin
					send_sample(16'sd16384);
					samples_sent++;
				end
			end
			
			begin
				while (samples_sent < 100 || count < 67) begin
					@(posedge clk);
					if (y_out_valid && samples_sent > 32) begin
						sum += q15_to_real(y_out);
						count++;
					end
				end
			end
		join
		/*
        
        // Send DC value (0.5)
        for (i = 0; i < 100; i++) begin
            send_sample(16'sd16384);  // 0.5 in Q15
            if (y_out_valid && i > 32) begin  // Skip transient
                sum += q15_to_real(y_out);
                count++;
            end
        end
        */
		
        avg = sum / count;
        $display("  Input: 0.5");
        $display("  Average Output: %f", avg);
        $display("  Gain: %f dB", 20.0 * $log10(avg / 0.5));
        
        if (avg > 0.45 && avg < 0.55) begin
            $display("PASS: DC gain approximately unity");
        end else begin
            $display("FAIL: DC gain error too large");
        end
    endtask
    
    // Test 3: Sine Wave Response
    task test_sine_wave(input real freq);
        logic signed [15:0] input_sample;	// , output_sample;
        real t, input_val, output_val;
        real input_power, output_power, gain_db;
        int i, samples_sent, outputs_received;
        real input_values[$];
		
        $display("\nTest 3: Sine Wave at %0.0f Hz", freq);
        
        input_power = 0;
        output_power = 0;
		samples_sent = 0;
		outputs_received = 0;
		
		fork
			begin
				for (i = 0; i < 200; i++) begin
					t = $itor(i) / SAMPLE_RATE;
					input_val = 0.5 * $sin(2.0 * 3.14159265359 * freq * t);
					input_sample = real_to_q15(input_val);
					input_values.push_back(input_val);
					send_sample(input_sample);
					samples_sent++;
				end
			end
			
			begin
				while (samples_sent < 200 || outputs_received < 167) begin
					@(posedge clk);
					if (y_out_valid) begin
						if (samples_sent > 50) begin
							output_val = q15_to_real(y_out);
							input_val = input_values[outputs_received];
							input_power += input_val * input_val;
							output_power += output_val * output_val;
						end
						outputs_received++;
					end
				end
			end
		join
		
        /*
        // Generate and send sine wave
        for (i = 0; i < 200; i++) begin
            t = $itor(i) / SAMPLE_RATE;
            input_val = 0.5 * $sin(2.0 * 3.14159265359 * freq * t);
            input_sample = real_to_q15(input_val);
            
            send_sample(input_sample);
            
            if (y_out_valid && i > 50) begin  // Skip transient
                output_val = q15_to_real(y_out);
                input_power += input_val * input_val;
                output_power += output_val * output_val;
            end
        end*/
        
        // Calculate gain
        gain_db = 10.0 * $log10(output_power / input_power);
        $display("  Frequency: %0.0f Hz", freq);
		$display("	Collected %0d output samples", outputs_received);
        $display("  Gain: %f dB", gain_db);
        
        if (freq < 4000) begin
            if (gain_db > -1.0 && gain_db < 1.0) begin
                $display("PASS: Passband gain within +/-1 dB");
            end else begin
                $display("FAIL: Passband gain out of spec");
            end
        end else begin
            if (gain_db < -10.0) begin
                $display("PASS: Stopband attenuation > 10 dB");
            end else begin
                $display("INFO: Stopband attenuation = %f dB", gain_db);
            end
        end
    endtask
    
    // Test 6: Mixed Signal (Multiple Frequencies)
    task test_mixed_signal();
        logic signed [15:0] input_sample;
        real t, input_val;
        int i;
        
        $display("\nTest 6: Mixed Frequency Signal");
        $display("  Combining 500 Hz + 2 kHz + 7 kHz");
        
        for (i = 0; i < 300; i++) begin
            t = $itor(i) / SAMPLE_RATE;
            // Mix three frequencies
            input_val = 0.2 * $sin(2.0 * 3.14159265359 * 500.0 * t)
                      + 0.2 * $sin(2.0 * 3.14159265359 * 2000.0 * t)
                      + 0.2 * $sin(2.0 * 3.14159265359 * 7000.0 * t);
            input_sample = real_to_q15(input_val);
            
            send_sample(input_sample);
        end
        $display("  Expected: 500 Hz and 2 kHz pass, 7 kHz attenuated");
    endtask
    
    // Watchdog timer
    initial begin
        #(CLK_PERIOD * 10000000);  // 100 ms timeout
        $display("ERROR: Simulation timeout!");
        $finish;
    end
    
    // Monitor outputs
    int output_count = 0;
    always @(posedge clk) begin
        if (y_out_valid) begin
            if (output_count < 10) begin
                $display("  y_out[%0d] = %d (%.4f)", output_count, y_out, q15_to_real(y_out));
            end
            output_count++;
        end
    end

endmodule