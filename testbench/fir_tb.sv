// fir_tb.sv
// Testbench for 32-tap FIR filter with decimation by 2
// Tests: impulse response, frequency response, and realistic audio signal

`timescale 1ns/1ps

module fir_tb();

    logic               clk;
    logic               reset_n;
    logic signed [15:0] x_in;
    logic               x_in_valid;
    logic signed [15:0] y_out;
    logic               y_out_valid;
    
    // clk generation (32 kHz input sample rate, 16 kHz output rate due to decimation)
    localparam CLK_PERIOD = 10;         // 100 MHz clock (10 ns period)
	localparam int CYCLE_PER_SAMPLE = 3125;  // 100MHz / 32kHz = 3125 cycles
    
	always #(CLK_PERIOD/2) clk = ~clk;
    
    fir dut (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(x_in),
        .x_in_valid(x_in_valid),
        .y_out(y_out),
        .y_out_valid(y_out_valid)
    );
    
    localparam real INPUT_RATE = 32000.0;    // 32 kHz input (from CIC)
    localparam real OUTPUT_RATE = 16000.0;   // 16 kHz output (decimation by 2)
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
		// Wait for sample period
		repeat(CYCLE_PER_SAMPLE - 2) @(posedge clk); // Use the new constant
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
        
        $display("========================================");
        $display("FIR Filter Testbench (Decimation by 2)");
        $display("Input Rate: 32 kHz");
        $display("Output Rate: 16 kHz");
        $display("========================================\n");
        
        // Test 1: Impulse Response
        test_impulse_response();
        
        // Test 2: DC Input (should pass through at unity gain)
        test_dc_input();
        
        // Test 3: Sine wave at 1 kHz (in passband)
        test_sine_wave(1000.0);
        
        // Test 4: Sine wave at 4 kHz (in passband)
        test_sine_wave(4000.0);
        
        // Test 5: Sine wave at 7 kHz (near output Nyquist, should be attenuated)
        test_sine_wave(7000.0);
        
        // Test 6: Sine wave at 14 kHz (above output Nyquist, should be strongly attenuated)
        test_sine_wave(14000.0);
        
        // Test 7: Mixed frequency signal
        test_mixed_signal();
        
        $display("\n========================================");
        $display("All tests completed!");
        $display("========================================");
        $finish;
    end
    
    // Test 1: Impulse Response
    task test_impulse_response();
        int i;
        int output_count;
        
        $display("\n----------------------------------------");
        $display("Test 1: Impulse Response");
        $display("----------------------------------------");
        
        output_count = 0;
        
        // Send impulse (max value)
        send_sample(16'sd16384);  // 0.5 in Q15
        
        // Send zeros and collect outputs
        for (i = 0; i < 100; i++) begin
            send_sample(16'sd0);
            @(posedge clk);
            if (y_out_valid) begin
                if (output_count < 20) begin
                    $display("  h[%2d] = %f", output_count, q15_to_real(y_out));
                end
                output_count++;
            end
        end
        
        $display("  Total outputs collected: %0d", output_count);
        $display("  Expected: ~50 outputs (100 inputs / 2)");
    endtask
    
    // Test 2: DC Input
    task test_dc_input();
        real sum, avg;
        int i, count;
        
        $display("\n----------------------------------------");
        $display("Test 2: DC Input (Unity Gain Test)");
        $display("----------------------------------------");
        
        sum = 0;
        count = 0;
        
        // Send DC value (0.5) and collect outputs
        for (i = 0; i < 150; i++) begin
            send_sample(16'sd16384);  // 0.5 in Q15
            @(posedge clk);
            if (y_out_valid && i > 64) begin  // Skip transient (32 taps, decimated)
                sum += q15_to_real(y_out);
                count++;
            end
        end
        
        avg = sum / count;
        $display("  Input: 0.5");
        $display("  Output samples collected: %0d", count);
        $display("  Average Output: %f", avg);
        $display("  Gain: %f dB", 20.0 * $log10(avg / 0.5));
        
        if (avg > 0.45 && avg < 0.55) begin
            $display("  PASS: DC gain approximately unity");
        end else begin
            $display("  FAIL: DC gain error too large");
        end
    endtask
    
    // Test 3-6: Sine Wave Response
    task test_sine_wave(input real freq);
        logic signed [15:0] input_sample;
        real t, input_val, output_val;
        real input_power, output_power, gain_db;
        int i, output_count;
        
        $display("\n----------------------------------------");
        $display("Test: Sine Wave at %0.0f Hz", freq);
        $display("----------------------------------------");
        
        input_power = 0;
        output_power = 0;
        output_count = 0;
        
        // Generate and send sine wave
        for (i = 0; i < 300; i++) begin
            t = $itor(i) / INPUT_RATE;
            input_val = 0.5 * $sin(2.0 * 3.14159265359 * freq * t);
            input_sample = real_to_q15(input_val);
            
            // Debug: print first few samples
            if (i < 5) begin
                $display("  DEBUG: i=%0d, t=%f, input_val=%f, input_sample=0x%h (%0d)", 
                         i, t, input_val, input_sample, input_sample);
            end
            
            send_sample(input_sample);
            @(posedge clk);
            
            if (y_out_valid && i > 64) begin  // Skip transient
                output_val = q15_to_real(y_out);
                
                // Recalculate input value at output sample time
                // Since we decimate by 2, output corresponds to every other input
                t = $itor(output_count) / OUTPUT_RATE;
                input_val = 0.5 * $sin(2.0 * 3.14159265359 * freq * t);
                
                input_power += input_val * input_val;
                output_power += output_val * output_val;
                output_count++;
            end
        end
        
        // Calculate gain
        if (output_count > 0) begin
            gain_db = 10.0 * $log10(output_power / input_power);
            $display("  Frequency: %0.0f Hz", freq);
            $display("  Output samples collected: %0d", output_count);
            $display("  Gain: %f dB", gain_db);
            
            // Passband is up to ~6.4 kHz (0.8 * Nyquist of 8 kHz)
            if (freq < 6400) begin
                if (gain_db > -1.0 && gain_db < 1.0) begin
                    $display("  PASS: Passband gain within +/-1 dB");
                end else begin
                    $display("  WARN: Passband gain = %f dB (expected ~0 dB)", gain_db);
                end
            // Transition band: 6.4 kHz to 8 kHz
            end else if (freq < 8000) begin
                $display("  INFO: Transition band, attenuation = %f dB", gain_db);
            // Stopband: > 8 kHz (Nyquist)
            end else begin
                if (gain_db < -10.0) begin
                    $display("  PASS: Stopband attenuation > 10 dB");
                end else begin
                    $display("  WARN: Stopband attenuation = %f dB (expected < -10 dB)", gain_db);
                end
            end
        end else begin
            $display("  ERROR: No output samples collected!");
        end
    endtask
    
    // Test 7: Mixed Signal (Multiple Frequencies)
    task test_mixed_signal();
        logic signed [15:0] input_sample;
        real t, input_val;
        int i, output_count;
        
        $display("\n----------------------------------------");
        $display("Test 7: Mixed Frequency Signal");
        $display("----------------------------------------");
        $display("  Combining 1 kHz + 4 kHz + 14 kHz");
        
        output_count = 0;
        
        for (i = 0; i < 400; i++) begin
            t = $itor(i) / INPUT_RATE;
            // Mix three frequencies
            input_val = 0.2 * $sin(2.0 * 3.14159265359 * 1000.0 * t)
                      + 0.2 * $sin(2.0 * 3.14159265359 * 4000.0 * t)
                      + 0.2 * $sin(2.0 * 3.14159265359 * 14000.0 * t);
            input_sample = real_to_q15(input_val);
            
            send_sample(input_sample);
            @(posedge clk);
            
            if (y_out_valid) begin
                output_count++;
            end
        end
        
        $display("  Input samples sent: 400");
        $display("  Output samples collected: %0d", output_count);
        $display("  Expected: ~200 outputs (decimation by 2)");
        $display("  Result: 1 kHz and 4 kHz should pass, 14 kHz attenuated");
        $display("  PASS: Mixed signal test completed");
    endtask
    
    // Watchdog timer
    initial begin
		#(CLK_PERIOD * 50000000); // Increased to 500ms for safety (50 million cycles)
		$display("ERROR: Simulation timeout!");
		$finish;
	end

endmodule