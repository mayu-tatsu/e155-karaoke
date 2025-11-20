// karaoke_top_tb.sv
// Testbench for complete PDM decimation chain
// Tests: PDM impulse response, DC input, sine waves at various frequencies

`timescale 1ns/1ps

module karaoke_top_tb();

    logic        pdm_data;
    logic        reset_n;
    logic        clk_out;
    logic [15:0] audio_sample;
    logic        audio_valid;
    logic        sck;
    logic        sdi;
    logic        done;
    logic        sdo;
    logic        led;
    
    // Instantiate DUT
    karaoke_top dut (
        .pdm_data(pdm_data),
        .reset_n(reset_n),
        .clk(clk_out),
        .audio_sample(audio_sample),
        .audio_valid(audio_valid),
        .sck(sck),
        .sdi(sdi),
        .done(done),
        .sdo(sdo),
        .led(led)
    );
    
    // Constants
    localparam real PDM_FREQ = 1_536_000.0;     // 1.536 MHz
    localparam real OUTPUT_RATE = 16_000.0;     // 16 kHz
    localparam real PDM_PERIOD = 1_000_000_000.0 / PDM_FREQ;  // ns
    
    // SPI clock generation (much slower than PDM clock)
    localparam real SPI_FREQ = 1_000_000.0;     // 1 MHz SPI clock
    localparam real SPI_PERIOD = 1_000_000_000.0 / SPI_FREQ;
    initial sck = 0;
    always #(SPI_PERIOD/2) sck = ~sck;
    
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
        static real integrator = 0.0;
        real error;
        
        // Clamp input to [-1, 1]
        if (analog_val > 1.0) analog_val = 1.0;
        if (analog_val < -1.0) analog_val = -1.0;
        
        // First-order sigma-delta
        integrator = integrator + analog_val;
        
        if (integrator >= 0.0) begin
            pdm_data = 1'b1;
            error = 1.0;
        end else begin
            pdm_data = 1'b0;
            error = -1.0;
        end
        
        integrator = integrator - error;
        
        // Wait for PDM clock period
        #PDM_PERIOD;
    endtask
    
    // Generate continuous PDM stream for a given analog signal
    task generate_pdm_signal(input int num_samples, input real signal[$]);
        int pdm_samples_per_output;
        int i, j;
        real current_val;
        
        // Decimation ratio: 1.536 MHz / 16 kHz = 96
        pdm_samples_per_output = 96;
        
        for (i = 0; i < num_samples; i++) begin
            current_val = signal[i];
            // Generate 96 PDM samples for each output sample
            for (j = 0; j < pdm_samples_per_output; j++) begin
                generate_pdm_sample(current_val);
            end
        end
    endtask
    
    // Collect output samples
    int output_count = 0;
    real output_samples[$];
    
    always @(posedge clk_out) begin
        if (audio_valid) begin
            output_samples.push_back(q15_to_real(audio_sample));
            output_count++;
        end
    end
    
    // Main test sequence
    initial begin
        // Initialize
        reset_n = 0;
        pdm_data = 0;
        sdi = 0;
        
        // Reset
        #1000;
        reset_n = 1;
        #1000;
        
        $display("=================================================");
        $display("Karaoke Top-Level Testbench Start");
        $display("PDM Clock: %.3f MHz", PDM_FREQ/1_000_000.0);
        $display("Output Rate: %.1f kHz", OUTPUT_RATE/1_000.0);
        $display("Decimation Ratio: %0d", $rtoi(PDM_FREQ/OUTPUT_RATE));
        $display("=================================================\n");
        
        // Test 1: DC Input
        test_dc_input();
        
        // Test 2: Low frequency sine wave (500 Hz - in passband)
        test_sine_wave(500.0);
        
        // Test 3: Mid frequency sine wave (2 kHz - in passband)
        test_sine_wave(2000.0);
        
        // Test 4: High frequency sine wave (6 kHz - near stopband)
        test_sine_wave(6000.0);
        
        // Test 5: Impulse response
        test_impulse_response();
        
        // Test 6: Mixed signal
        test_mixed_signal();
        
        $display("\n=================================================");
        $display("All tests completed!");
        $display("Total output samples collected: %0d", output_count);
        $display("=================================================");
        $finish;
    end
    
    // Test 1: DC Input
    task test_dc_input();
        real signal[$];
        real dc_value;
        int i;
        int start_idx, end_idx;
        real sum, avg;
        
        $display("\n-------------------------------------------------");
        $display("Test 1: DC Input (Unity Gain Test)");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        
        dc_value = 0.5;
        
        // Generate 200 samples of DC
        for (i = 0; i < 200; i++) begin
            signal.push_back(dc_value);
        end
        
        // Generate PDM stream
        generate_pdm_signal(signal.size(), signal);
        
        // Wait for outputs to settle
        #(100 * PDM_PERIOD * 96);
        
        // Analyze output (skip first 50 samples for transient)
        start_idx = 50;
        end_idx = output_samples.size() - 1;
        sum = 0.0;
        
        for (i = start_idx; i < end_idx; i++) begin
            sum += output_samples[i];
        end
        
        avg = sum / (end_idx - start_idx);
        
        $display("  Input DC value: %.3f", dc_value);
        $display("  Output samples collected: %0d", output_samples.size());
        $display("  Average output (after transient): %.3f", avg);
        $display("  Error: %.3f (%.1f%%)", avg - dc_value, 
                 100.0 * (avg - dc_value) / dc_value);
        
        if ($abs(avg - dc_value) < 0.1) begin
            $display("  PASS: DC response within tolerance");
        end else begin
            $display("  FAIL: DC response error too large");
        end
    endtask
    
    // Test 2-4: Sine Wave Response
    task test_sine_wave(input real freq);
        real signal[$];
        real t, analog_val;
        int i;
        int start_idx, end_idx;
        real input_power, output_power, gain_db;
        
        $display("\n-------------------------------------------------");
        $display("Test: Sine Wave at %.0f Hz", freq);
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        
        // Generate sine wave (300 samples = 18.75 ms at 16 kHz)
        for (i = 0; i < 300; i++) begin
            t = $itor(i) / OUTPUT_RATE;
            analog_val = 0.5 * $sin(2.0 * 3.14159265359 * freq * t);
            signal.push_back(analog_val);
        end
        
        // Generate PDM stream
        generate_pdm_signal(signal.size(), signal);
        
        // Wait for processing
        #(100 * PDM_PERIOD * 96);
        
        // Calculate power (skip first 100 samples for transient)
        start_idx = 100;
        end_idx = output_samples.size() - 1;
        input_power = 0.0;
        output_power = 0.0;
        
        for (i = start_idx; i < end_idx; i++) begin
            input_power += signal[i] * signal[i];
            output_power += output_samples[i] * output_samples[i];
        end
        
        gain_db = 10.0 * $log10(output_power / input_power);
        
        $display("  Frequency: %.0f Hz", freq);
        $display("  Output samples collected: %0d", output_samples.size());
        $display("  Input power: %.6f", input_power);
        $display("  Output power: %.6f", output_power);
        $display("  Gain: %.2f dB", gain_db);
        
        if (freq < 4000.0) begin
            // Passband test
            if (gain_db > -3.0 && gain_db < 3.0) begin
                $display("  PASS: Passband gain within +/-3 dB");
            end else begin
                $display("  WARN: Passband gain outside spec");
            end
        end else begin
            // Stopband test
            if (gain_db < -10.0) begin
                $display("  PASS: Stopband attenuation > 10 dB");
            end else begin
                $display("  INFO: Stopband attenuation = %.2f dB", gain_db);
            end
        end
    endtask
    
    // Test 5: Impulse Response
    task test_impulse_response();
        real signal[$];
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 5: Impulse Response");
        $display("-------------------------------------------------");
        
        output_count = 0;
        output_samples.delete();
        
        // Generate impulse: one high sample followed by zeros
        signal.push_back(0.8);
        for (i = 0; i < 150; i++) begin
            signal.push_back(0.0);
        end
        
        // Generate PDM stream
        generate_pdm_signal(signal.size(), signal);
        
        // Wait for processing
        #(100 * PDM_PERIOD * 96);
        
        $display("  Impulse input generated");
        $display("  Output samples collected: %0d", output_samples.size());
        
        // Display first 20 impulse response coefficients
        $display("  First 20 impulse response samples:");
        for (i = 0; i < 20 && i < output_samples.size(); i++) begin
            $display("    h[%2d] = %8.5f", i, output_samples[i]);
        end
    endtask
    
    // Test 6: Mixed Signal
    task test_mixed_signal();
        real signal[$];
        real t, analog_val;
        int i;
        
        $display("\n-------------------------------------------------");
        $display("Test 6: Mixed Frequency Signal");
        $display("-------------------------------------------------");
        $display("  Combining 500 Hz + 2 kHz + 7 kHz");
        
        output_count = 0;
        output_samples.delete();
        
        // Generate mixed signal
        for (i = 0; i < 250; i++) begin
            t = $itor(i) / OUTPUT_RATE;
            analog_val = 0.2 * $sin(2.0 * 3.14159265359 * 500.0 * t)
                       + 0.2 * $sin(2.0 * 3.14159265359 * 2000.0 * t)
                       + 0.2 * $sin(2.0 * 3.14159265359 * 7000.0 * t);
            signal.push_back(analog_val);
        end
        
        // Generate PDM stream
        generate_pdm_signal(signal.size(), signal);
        
        // Wait for processing
        #(100 * PDM_PERIOD * 96);
        
        $display("  Output samples collected: %0d", output_samples.size());
        $display("  Expected: 500 Hz and 2 kHz pass through");
        $display("            7 kHz should be attenuated");
    endtask
    
    // Monitor for debugging
    int audio_valid_count = 0;
    always @(posedge clk_out) begin
        if (audio_valid) begin
            audio_valid_count++;
            if (audio_valid_count <= 5) begin
                $display("[%0t ns] Audio sample #%0d: %d (%.4f)", 
                         $time, audio_valid_count, audio_sample, 
                         q15_to_real(audio_sample));
            end
        end
    end
    
    // Watchdog timer
    initial begin
        #(1_000_000_000);  // 1 second timeout
        $display("ERROR: Simulation timeout!");
        $finish;
    end

endmodule