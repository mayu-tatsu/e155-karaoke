// hb1_tb.sv


// Testbench for halfband decimation filter (hb1)
// Tests decimation by 2 from 128 kHz to 64 kHz

`timescale 1ns / 1ps

module hb1_tb();
    logic clk;
    logic reset_n;
    
    logic signed [15:0] x_in;
    logic               x_in_valid;
    logic signed [15:0] y_out;
    logic               y_out_valid;
    
    localparam real CLK_PERIOD = 651.04;        // 1.536 MHz clock (from CIC output)
    localparam real INPUT_RATE = 128000.0;      // 128 kHz input sample rate (after CIC decimation)
    localparam real OUTPUT_RATE = 64000.0;      // 64 kHz output sample rate (after hb1 decimation)
    localparam int  NUM_SAMPLES = 256;          // Number of test samples
    
    // input sample period (12 clocks at 1.536 MHz = 1/128kHz)
    localparam int INPUT_PERIOD_CLKS = 12;
    
    int sample_count;
    int output_count;
    real time_val;
    
    hb1 dut (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(x_in),
        .x_in_valid(x_in_valid),
        .y_out(y_out),
        .y_out_valid(y_out_valid)
    );
    
    // clk generation (1.536 MHz)
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    always @(posedge clk) begin
        if (y_out_valid) begin
            $display("Time=%0t ns: Output[%0d] = %0d (0x%04h)", 
                     $time, output_count, y_out, y_out);
            output_count++;
        end
    end
    
    // Main test sequence
    initial begin
        // Initialize signals
        reset_n = 0;
        x_in = 0;
        x_in_valid = 0;
        sample_count = 0;
        output_count = 0;
        
        $display("Halfband Filter (hb1) Testbench");
        $display("Input rate:  128 kHz (simulating CIC output)");
        $display("Output rate: 64 kHz (decimation by 2)");
        $display("Clock freq:  1.536 MHz");
        $display("");
        
        // Reset sequence
        repeat(10) @(posedge clk);
        reset_n = 1;
        $display("Reset released");
        repeat(5) @(posedge clk);
        
        // Test 1: DC input (constant value)
        $display("\nTest 1: DC Input (value = 1000)");
        test_dc_input(16'sd1000, 50);
        
        // Test 2: Low frequency sine wave (1 kHz)
        $display("\nTest 2: 1 kHz Sine Wave");
        test_sine_wave(1000.0, 5000, 50);
        
        // Test 3: Higher frequency sine wave (8 kHz)
        $display("\nTest 3: 8 kHz Sine Wave");
        test_sine_wave(8000.0, 5000, 50);
        
        // Test 4: Step response
        $display("\nTest 4: Step Response");
        test_step_response(50);
        
        // Test 5: Impulse response
        $display("\nTest 5: Impulse Response");
        test_impulse_response(50);
        
        // Test 6: Check decimation ratio
        $display("\nTest 6: Decimation Ratio Verification");
        verify_decimation_ratio(100);
        
        // Wait for final outputs
        repeat(100) @(posedge clk);
        
        $display("\nAll tests completed");
        $display("Total input samples:  %0d", sample_count);
        $display("Total output samples: %0d", output_count);
        $display("Decimation ratio:     %0.2f", real'(sample_count)/real'(output_count));
        
        $finish;
    end
    
    // Task: Send a single sample to DUT
    task send_sample(input logic signed [15:0] sample);
        x_in = sample;
        x_in_valid = 1;
        @(posedge clk);
        x_in_valid = 0;
        // Wait for next input sample period (12 clocks)
        repeat(INPUT_PERIOD_CLKS - 1) @(posedge clk);
        sample_count++;
    endtask
    
    // Task: Test DC input
    task test_dc_input(input logic signed [15:0] dc_value, input int num_samples);
        int i;
        $display("Sending %0d samples of DC value %0d", num_samples, dc_value);
        for (i = 0; i < num_samples; i++) begin
            send_sample(dc_value);
        end
    endtask
    
    // Task: Test sine wave
    task test_sine_wave(input real freq_hz, input int amplitude, input int num_samples);
        int i;
        real phase, sample_real;
        logic signed [15:0] sample;
        
        $display("Generating %0d Hz sine wave, amplitude=%0d, %0d samples", 
                 freq_hz, amplitude, num_samples);
        
        for (i = 0; i < num_samples; i++) begin
            // Calculate sine wave sample
            time_val = real'(i) / INPUT_RATE;  // time in seconds
            phase = 2.0 * 3.14159265359 * freq_hz * time_val;
            sample_real = amplitude * $sin(phase);
            sample = $rtoi(sample_real);
            
            send_sample(sample);
        end
    endtask
    
    // Task: Test step response
    task test_step_response(input int num_samples);
        int i;
        $display("Generating step response (0 -> 8000), %0d samples", num_samples);
        
        // Send zeros
        for (i = 0; i < num_samples/2; i++) begin
            send_sample(16'sd0);
        end
        
        // Send constant value
        for (i = 0; i < num_samples/2; i++) begin
            send_sample(16'sd8000);
        end
    endtask
    
    // Task: Test impulse response
    task test_impulse_response(input int num_samples);
        int i;
        $display("Generating impulse response, %0d samples", num_samples);
        
        // Send impulse
        send_sample(16'sd10000);
        
        // Send zeros
        for (i = 1; i < num_samples; i++) begin
            send_sample(16'sd0);
        end
    endtask
    
    // Task: Verify decimation ratio is 2:1
    task verify_decimation_ratio(input int num_samples);
        int i;
        int start_in_count, start_out_count;
        int end_in_count, end_out_count;
        real actual_ratio;
        
        start_in_count = sample_count;
        start_out_count = output_count;
        
        $display("Sending %0d samples to verify 2:1 decimation...", num_samples);
        
        for (i = 0; i < num_samples; i++) begin
            send_sample(16'sd1000);
        end
        
        // Wait for all outputs
        repeat(50) @(posedge clk);
        
        end_in_count = sample_count;
        end_out_count = output_count;
        
        actual_ratio = real'(end_in_count - start_in_count) / real'(end_out_count - start_out_count);
        
        $display("Input samples:  %0d", end_in_count - start_in_count);
        $display("Output samples: %0d", end_out_count - start_out_count);
        $display("Actual ratio:   %0.2f", actual_ratio);
        
        if (actual_ratio > 1.9 && actual_ratio < 2.1) begin
            $display("PASS: Decimation ratio is approximately 2:1");
        end else begin
            $display("FAIL: Decimation ratio is not 2:1!");
        end
    endtask
    
    // Timeout watchdog
    initial begin
        #10ms;
        $display("ERROR: Testbench timeout!");
        $finish;
    end

endmodule