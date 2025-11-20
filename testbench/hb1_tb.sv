// hb_tb.v
// Inline testbench for hb1 halfband decimation filter
// Decimation by 2: 128 kHz -> 64 kHz

`timescale 1ns / 1ps

module hb_tb();

    // Clock and reset
    logic clk;
    logic reset_n;

    // DUT signals
    logic signed [15:0] x_in;
    logic x_in_valid;
    logic signed [15:0] y_out;
    logic y_out_valid;

    // Parameters
    localparam real CLK_PERIOD = 651.04;     // 1.536 MHz
    localparam int INPUT_PERIOD_CLKS = 12;   // 128 kHz input period

    // Counters and loop variables (must declare all at top)
    int sample_count;
    int output_count;
    int j, k, l, m, n;
    int start_in_count, start_out_count;
    int end_in_count, end_out_count;

    // Helper variables
    real time_val;
    real phase;
    real sample_real;
    logic signed [15:0] sample;
    real actual_ratio;

    // DUT instance
    hb dut (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(x_in),
        .x_in_valid(x_in_valid),
        .y_out(y_out),
        .y_out_valid(y_out_valid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Monitor DUT output
    always @(posedge clk) begin
        if (y_out_valid) begin
            $display("Time=%0t ns: Output[%0d] = %0d (0x%04h)", $time, output_count, y_out, y_out);
            output_count = output_count + 1;
        end
    end

    // Main testbench
    initial begin
        // Initialize
        reset_n = 0;
        x_in = 0;
        x_in_valid = 0;
        sample_count = 0;
        output_count = 0;

        $display("Halfband Filter (hb1) Inline Testbench");
        $display("Clock freq: 1.536 MHz (1/128kHz input period ~12 cycles)");

        // Reset
        # (10*CLK_PERIOD);
        reset_n = 1;
        $display("Reset released");
        # (5*CLK_PERIOD);

        // -------------------------------
        // Test 1: DC input = 1000
        // -------------------------------
        $display("\nTest 1: DC Input (value = 1000)");
        for (j = 0; j < 50; j = j + 1) begin
            x_in = 16'sd1000;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end

        // -------------------------------
        // Test 2: 1 kHz sine wave
        // -------------------------------
        $display("\nTest 2: 1 kHz Sine Wave");
        for (k = 0; k < 50; k = k + 1) begin
            time_val = real'(k)/128000.0;
            phase = 2.0*3.14159265359*1000.0*time_val;
            sample_real = 5000.0 * $sin(phase);
            sample = $rtoi(sample_real);
            x_in = sample;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end

        // -------------------------------
        // Test 3: 8 kHz sine wave
        // -------------------------------
        $display("\nTest 3: 8 kHz Sine Wave");
        for (l = 0; l < 50; l = l + 1) begin
            time_val = real'(l)/128000.0;
            phase = 2.0*3.14159265359*8000.0*time_val;
            sample_real = 5000.0 * $sin(phase);
            sample = $rtoi(sample_real);
            x_in = sample;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end

        // -------------------------------
        // Test 4: Step response
        // -------------------------------
        $display("\nTest 4: Step Response");
        for (m = 0; m < 25; m = m + 1) begin
            x_in = 16'sd0;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end
        for (m = 0; m < 25; m = m + 1) begin
            x_in = 16'sd8000;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end

        // -------------------------------
        // Test 5: Impulse response
        // -------------------------------
        $display("\nTest 5: Impulse Response");
        x_in = 16'sd10000;
        x_in_valid = 1;
        #CLK_PERIOD;
        x_in_valid = 0;
        #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
        sample_count = sample_count + 1;

        for (n = 1; n < 50; n = n + 1) begin
            x_in = 16'sd0;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end

        // -------------------------------
        // Test 6: Decimation ratio verification
        // -------------------------------
        $display("\nTest 6: Decimation Ratio Verification");
        start_in_count = sample_count;
        start_out_count = output_count;

        for (j = 0; j < 100; j = j + 1) begin
            x_in = 16'sd1000;
            x_in_valid = 1;
            #CLK_PERIOD;
            x_in_valid = 0;
            #((INPUT_PERIOD_CLKS-1)*CLK_PERIOD);
            sample_count = sample_count + 1;
        end

        // Wait for DUT output
        # (50*CLK_PERIOD);

        end_in_count = sample_count;
        end_out_count = output_count;
        actual_ratio = real'(end_in_count - start_in_count) / real'(end_out_count - start_out_count);

        $display("Input samples:  %0d", end_in_count - start_in_count);
        $display("Output samples: %0d", end_out_count - start_out_count);
        $display("Actual ratio:   %0.2f", actual_ratio);
        if (actual_ratio > 1.9 && actual_ratio < 2.1)
            $display("PASS: Decimation ratio is approximately 2:1");
        else
            $display("FAIL: Decimation ratio is not 2:1!");

        // Wait for additional outputs
        # (100*CLK_PERIOD);

        $display("\nAll tests completed");
        $display("Total input samples:  %0d", sample_count);
        $display("Total output samples: %0d", output_count);
        $display("Decimation ratio:     %0.2f", real'(sample_count)/real'(output_count));

        $finish;
    end

    // Timeout watchdog
    initial begin
        #10_000_000; // 10 ms
        $display("ERROR: Testbench timeout!");
        $finish;
    end

endmodule
