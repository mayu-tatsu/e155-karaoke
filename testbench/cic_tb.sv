// cic_tb.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16

// Based on this Youtube Tutorial: https://www.youtube.com/watch?v=RvvOLhBH7-k

`timescale 1ns / 1ps

module cic_tb();

    localparam PDM_CLK_PERIOD = 651;                        // 1.536 MHz PDM clock (1/1.536 MHz = 651 ns)
    localparam DECIMATION = 24;
    localparam OUTPUT_PERIOD = PDM_CLK_PERIOD * DECIMATION; // decimated output rate
    
    logic pdm_clk = 1'b0;
    logic reset_n = 1'b0;
    logic pdm_in = 1'b0;            // pdm signal generation
    logic signed [15:0] dout;
    logic dout_valid;
    
    real phase = 0.0;
    real phase_increment;
    real test_freq = 1000.0;              // 1 kHz test tone
    real pdm_sample_rate = 1.536e6;       // 2.304 MHz
    real signal_amplitude = 0.8;          // 80% of full scale
    real sigma_delta_integrator = 0.0;
    real audio_sample;
    
    integer valid_count = 0;
    integer total_cycles = 0;
    
    cic #(
        .R(24),
        .N(4),
        .M(1),
        .OUT_WIDTH(16),
        .NORMALIZE(0)                      // no normalization
    ) dut (
        .clk(pdm_clk),
        .reset_n(reset_n),
        .pdm_in(pdm_in),
        .dout(dout),
        .dout_valid(dout_valid)
    );
    
    // clk
    always #(PDM_CLK_PERIOD/2) pdm_clk = ~pdm_clk;
    

    // pdm signal generation, uses sigma-delta modulation
    always @(posedge pdm_clk) begin
        if (~reset_n) begin
            phase <= 0.0;
            sigma_delta_integrator <= 0.0;
            pdm_in <= 1'b0;
        end else begin
            // test sine wave
            audio_sample = signal_amplitude * $sin(2.0 * 3.14159265359 * phase);
            
            // first-order sigma-delta modulator
            sigma_delta_integrator = sigma_delta_integrator + audio_sample;
            
            if (sigma_delta_integrator >= 0.0) begin
                pdm_in <= 1'b1;
                sigma_delta_integrator = sigma_delta_integrator - 1.0;
            end else begin
                pdm_in <= 1'b0;
                sigma_delta_integrator = sigma_delta_integrator + 1.0;
            end
            
            // update phase for next sample
            phase = phase + phase_increment;
            if (phase >= 1.0) phase = phase - 1.0;
        end
    end
    
    // Output monitoring
    always @(posedge pdm_clk) begin
        total_cycles <= total_cycles + 1;
        
        if (dout_valid) begin
            valid_count <= valid_count + 1;
            $display("Time=%0t ns: dout_valid asserted, dout=%0d (0x%h)", 
                     $time, dout, dout);
        end
    end
    
    // tests
    initial begin
        // calc phase increment
        phase_increment = test_freq / pdm_sample_rate;
        
        $display("\nCIC Decimator Testbench");
        $display("PDM Clock Period: %0d ns (%.3f MHz)", PDM_CLK_PERIOD, 1000.0/PDM_CLK_PERIOD);
        $display("Decimation Factor: %0d", DECIMATION);
        $display("Output Sample Rate: %.3f kHz", (1000.0 / PDM_CLK_PERIOD) / DECIMATION);
        $display("Test Signal: %.1f Hz sine wave", test_freq);
        
        // reset test
        reset_n = 1'b0; #(PDM_CLK_PERIOD * 10); reset_n = 1'b1;
        $display("\nTime=%0t ns: Reset released\n", $time);
        
        // run for like 50 cycles to get several valid outputs
        #(PDM_CLK_PERIOD * DECIMATION * 5000);
        
        // summary + stats
        $display("\nTest Complete");
        $display("Total clock cycles: %0d", total_cycles);
        $display("Valid outputs received: %0d", valid_count);
        $display("Expected outputs: ~%0d", total_cycles / DECIMATION);
        
        if (valid_count > 40) begin
            $display("\n*** TEST PASSED: Received expected number of outputs ***");
        end else begin
            $display("\n*** TEST FAILED: Too few outputs received ***");
        end
        $finish;
    end

endmodule