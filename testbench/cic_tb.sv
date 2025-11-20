// cic_tb.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16
// Comprehensive testbench for CIC decimator with multiple test cases

`timescale 1ns/1ps

module cic_tb();

    logic        pdm_clk;
    logic        reset_n;
    logic        pdm_in;
    logic signed [15:0] dout;
    logic        dout_valid;
    
    // Clock generation
    localparam real PDM_FREQ = 1_536_000.0;  // 1.536 MHz
    localparam real PDM_PERIOD = 1_000_000_000.0 / PDM_FREQ;  // ns
    localparam int  DECIMATION = 24;
    localparam real OUTPUT_RATE = PDM_FREQ / DECIMATION;  // 64 kHz
    
    initial pdm_clk = 0;
    always #(PDM_PERIOD/2) pdm_clk = ~pdm_clk;
    
    // DUT instantiation
    cic #(
        .R(24),
        .N(4),
        .M(1),
        .OUT_WIDTH(16),
        .NORMALIZE(1)  // Enable normalization for proper scaling
    ) dut (
        .clk(pdm_clk),
        .reset_n(reset_n),
        .pdm_in(pdm_in),
        .dout(dout),
        .dout_valid(dout_valid)
    );
    
    // Sigma-delta modulator state
    real sigma_delta_integrator = 0.0;
    
    // Helper functions
    function real q15_to_real(logic signed [15:0] val);
        return $itor(val) / 32768.0;
    endfunction
    
    function logic signed [15:0] real_to_q15(real val);
        real clamped;
        clamped = (val > 0.9999) ? 0.9999 : (val < -1.0) ? -1.0 : val;
        return $rtoi(clamped * 32768.0);
    endfunction
    
    // PDM generation using first-order sigma-delta modulation
    task generate_pdm_sample(input real analog_val);
        real error;
        
        // Clamp input to [-1, 1]
        if (analog_val > 1.0) analog_val = 1.0;
        if (analog_val < -1.0) analog_val = -1.0;
        
        // First-order sigma-delta
        sigma_delta_integrator = sigma_delta_integrator + analog_val;
        
        if (sigma_delta_integrator >= 0.0) begin
            pdm_in = 1'b1;
            error = 1.0;
        end else begin
            pdm_in = 1'b0;
            error = -1.0;
        end
        
        sigma_delta_integrator = sigma_delta_integrator - error;
        
        @(posedge pdm_clk);
    endtask
    
    // Generate continuous PDM stream
    task generate_pdm_tone(input real freq, input int num_output_samples);
        real phase, phase_inc, analog_val;
        int i, j;
        
        phase = 0.0;
        phase_inc = freq / PDM_FREQ;
        
        // Generate PDM for specified number of output samples
        for (i = 0; i < num_output_samples * DECIMATION; i++) begin
            analog_val = 0.7 * $sin(2.0 * 3.14159265359 * phase);
            generate_pdm_sample(analog_val);
            
            phase = phase + phase_inc;
            if (phase >= 1.0) phase = phase - 1.0;
        end
    endtask
    
    // Generate DC PDM stream
    task generate_pdm_dc(input real dc_value, input int num_output_samples);
        int i;
        
        for (i = 0; i < num_output_samples * DECIMATION; i++) begin
            generate_pdm_sample(dc_value);
        end
    endtask
    
    // Collect output samples
    real output_samples[$];
    int output_count = 0;
    
    always @(posedge pdm_clk) begin
        if (dout_valid) begin
            output_samples.push_back(q15_to_real(dout));
            output_count++;
        end
    end
    
    // Main test sequence
    initial begin
        $display("=================================================");
        $display("CIC Decimator Testbench");
        $display("PDM Clock: %.3f MHz", PDM_FREQ/1_000_000.0);
        $display("Decimation: %0d", DECIMATION);
        $display("Output Rate: %.1f kHz", OUTPUT_RATE/1_000.0);
        $display("=================================================\n");
        
        // Initialize
        reset_n = 0;
        pdm_in = 0;
        sigma_delta_integrator = 0.0;
        
        // Reset
        repeat(10) @(posedge pdm_clk);
        reset_n = 1;
        repeat(10) @(posedge pdm_clk);
        
        // Run tests
        test_all_zeros();
        test_all_ones();
        test_alternating();
        test_dc_positive();
        test_dc_negative();
        test_dc_zero();
        test_sine_wave(500.0);
        test_sine_wave(5000.0);
        test_sine_wave(15000.0);
        test_sine_wave(30000.0);
        test_impulse();
        test_step_response();
        test_mixed_signal();
        
        $display("\n=================================================");
        $display("All CIC tests completed!");
        $display("=================================================");
        $finish;
    end
    
    // Test 1: All zeros (PDM = 0)
    task test_all_zeros();
        int i;
        real sum, avg;
        
        $display("\n-------------------------------------------------");
        $display("Test 1: All Zeros (PDM = 0)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        
        // Send all zeros
        for (i = 0; i < 100 * DECIMATION; i++) begin
            pdm_in = 1'b0;
            @(posedge pdm_clk);
        end
        
        // Calculate average (should be close to -1.0)
        sum = 0.0;
        for (i = 20; i < output_samples.size(); i++) begin
            sum += output_samples[i];
        end
        avg = sum / (output_samples.size() - 20);
        
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Average output: %.4f", avg);
        $display("  Expected: -1.0 (for PDM=0)");
        
        if (avg < -0.8 && avg > -1.2) begin
            $display("  PASS: Output in expected range");
        end else begin
            $display("  FAIL: Output out of range");
        end
    endtask
    
    // Test 2: All ones (PDM = 1)
    task test_all_ones();
        int i;
        real sum, avg;
        
        $display("\n-------------------------------------------------");
        $display("Test 2: All Ones (PDM = 1)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        
        // Send all ones
        for (i = 0; i < 100 * DECIMATION; i++) begin
            pdm_in = 1'b1;
            @(posedge pdm_clk);
        end
        
        // Calculate average (should be close to +1.0)
        sum = 0.0;
        for (i = 20; i < output_samples.size(); i++) begin
            sum += output_samples[i];
        end
        avg = sum / (output_samples.size() - 20);
        
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Average output: %.4f", avg);
        $display("  Expected: +1.0 (for PDM=1)");
        
        if (avg > 0.8 && avg < 1.2) begin
            $display("  PASS: Output in expected range");
        end else begin
            $display("  FAIL: Output out of range");
        end
    endtask
    
    // Test 3: Alternating pattern
    task test_alternating();
        int i;
        real sum, avg;
        
        $display("\n-------------------------------------------------");
        $display("Test 3: Alternating Pattern (010101...)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        
        // Send alternating pattern
        for (i = 0; i < 100 * DECIMATION; i++) begin
            pdm_in = i[0];  // Alternate between 0 and 1
            @(posedge pdm_clk);
        end
        
        // Calculate average (should be close to 0.0)
        sum = 0.0;
        for (i = 20; i < output_samples.size(); i++) begin
            sum += output_samples[i];
        end
        avg = sum / (output_samples.size() - 20);
        
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Average output: %.4f", avg);
        $display("  Expected: ~0.0 (50%% duty cycle)");
        
        if (avg > -0.2 && avg < 0.2) begin
            $display("  PASS: Output near zero");
        end else begin
            $display("  WARN: Output offset from zero");
        end
    endtask
    
    // Test 4: DC Positive
    task test_dc_positive();
        real sum, avg;
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 4: DC Input (+0.5)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        generate_pdm_dc(0.5, 150);
        
        // Calculate average (skip transient)
        sum = 0.0;
        for (i = 50; i < output_samples.size(); i++) begin
            sum += output_samples[i];
        end
        avg = sum / (output_samples.size() - 50);
        
        $display("  Input DC: +0.5");
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Average output: %.4f", avg);
        $display("  Error: %.4f (%.1f%%)", avg - 0.5, 100.0 * (avg - 0.5) / 0.5);
        
        if ($abs(avg - 0.5) < 0.1) begin
            $display("  PASS: DC gain within tolerance");
        end else begin
            $display("  FAIL: DC gain error too large");
        end
    endtask
    
    // Test 5: DC Negative
    task test_dc_negative();
        real sum, avg;
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 5: DC Input (-0.5)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        generate_pdm_dc(-0.5, 150);
        
        // Calculate average (skip transient)
        sum = 0.0;
        for (i = 50; i < output_samples.size(); i++) begin
            sum += output_samples[i];
        end
        avg = sum / (output_samples.size() - 50);
        
        $display("  Input DC: -0.5");
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Average output: %.4f", avg);
        $display("  Error: %.4f", avg - (-0.5));
        
        if ($abs(avg - (-0.5)) < 0.1) begin
            $display("  PASS: DC gain within tolerance");
        end else begin
            $display("  FAIL: DC gain error too large");
        end
    endtask
    
    // Test 6: DC Zero
    task test_dc_zero();
        real sum, avg;
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 6: DC Input (0.0)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        generate_pdm_dc(0.0, 150);
        
        // Calculate average
        sum = 0.0;
        for (i = 50; i < output_samples.size(); i++) begin
            sum += output_samples[i];
        end
        avg = sum / (output_samples.size() - 50);
        
        $display("  Input DC: 0.0");
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Average output: %.4f", avg);
        
        if ($abs(avg) < 0.1) begin
            $display("  PASS: Zero input produces near-zero output");
        end else begin
            $display("  WARN: DC offset detected");
        end
    endtask
    
    // Test 7-10: Sine Wave Response
    task test_sine_wave(input real freq);
        real input_power, output_power, gain_db;
        real phase, phase_inc, input_val;
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test: Sine Wave at %.0f Hz", freq);
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        generate_pdm_tone(freq, 300);
        
        // Calculate power (skip transient)
        phase = 0.0;
        phase_inc = freq / OUTPUT_RATE;
        input_power = 0.0;
        output_power = 0.0;
        
        for (i = 100; i < output_samples.size(); i++) begin
            input_val = 0.7 * $sin(2.0 * 3.14159265359 * phase);
            input_power += input_val * input_val;
            output_power += output_samples[i] * output_samples[i];
            phase = phase + phase_inc;
            if (phase >= 1.0) phase = phase - 1.0;
        end
        
        gain_db = 10.0 * $log10(output_power / input_power);
        
        $display("  Frequency: %.0f Hz", freq);
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Gain: %.2f dB", gain_db);
        
        // CIC has passband droop, so allow wider tolerance
        if (freq < OUTPUT_RATE / 4) begin
            $display("  Expected: Passband (some droop acceptable)");
        end else begin
            $display("  Expected: Transition/stopband");
        end
    endtask
    
    // Test 11: Impulse Response
    task test_impulse();
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 11: Impulse Response");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        // Generate impulse (high value for one output period, then zeros)
        generate_pdm_dc(0.8, 1);
        generate_pdm_dc(0.0, 100);
        
        $display("  Samples collected: %0d", output_samples.size());
        $display("  First 20 impulse response samples:");
        for (i = 0; i < 20 && i < output_samples.size(); i++) begin
            $display("    h[%2d] = %8.5f", i, output_samples[i]);
        end
    endtask
    
    // Test 12: Step Response
    task test_step_response();
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 12: Step Response");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        // Start with zeros, then step to positive
        generate_pdm_dc(0.0, 50);
        generate_pdm_dc(0.7, 150);
        
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Step response samples (around transition):");
        for (i = 45; i < 65 && i < output_samples.size(); i++) begin
            $display("    y[%2d] = %8.5f", i, output_samples[i]);
        end
    endtask
    
    // Test 13: Mixed Signal
    task test_mixed_signal();
        real phase1, phase2, phase3, inc1, inc2, inc3;
        real freq1, freq2, freq3, analog_val;
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 13: Mixed Frequency Signal");
        $display("-------------------------------------------------");
        
        freq1 = 1000.0;
        freq2 = 8000.0;
        freq3 = 25000.0;
        
        $display("  Combining %.0f Hz + %.0f Hz + %.0f Hz", freq1, freq2, freq3);
        
        output_count = 0;
        output_samples.delete();
        sigma_delta_integrator = 0.0;
        
        phase1 = 0.0; inc1 = freq1 / PDM_FREQ;
        phase2 = 0.0; inc2 = freq2 / PDM_FREQ;
        phase3 = 0.0; inc3 = freq3 / PDM_FREQ;
        
        for (i = 0; i < 300 * DECIMATION; i++) begin
            analog_val = 0.2 * $sin(2.0 * 3.14159265359 * phase1)
                       + 0.2 * $sin(2.0 * 3.14159265359 * phase2)
                       + 0.2 * $sin(2.0 * 3.14159265359 * phase3);
            generate_pdm_sample(analog_val);
            
            phase1 += inc1; if (phase1 >= 1.0) phase1 -= 1.0;
            phase2 += inc2; if (phase2 >= 1.0) phase2 -= 1.0;
            phase3 += inc3; if (phase3 >= 1.0) phase3 -= 1.0;
        end
        
        $display("  Samples collected: %0d", output_samples.size());
        $display("  Expected: All frequencies present (CIC has wide passband)");
    endtask
    
    // Watchdog timer
    initial begin
        #100_000_000;  // 100 ms timeout
        $display("ERROR: Simulation timeout!");
        $finish;
    end

endmodule