// spi_tb.sv
// Testbench for SPI module
// Tests timing, data integrity, and multiple transfers

`timescale 1ns/1ps

module spi_tb();

    logic        clk;
    logic        reset_n;
    logic        sck;
    logic        sdo;
    logic        audio_valid;
    logic [15:0] pcm_out;          // *** FIXED: input to DUT ***

    // Clock generation
    localparam CLK_PERIOD = 10;      // 100 MHz system clock
    localparam SCK_PERIOD = 100;     // 10 MHz SPI clock (slower than system clock)

    always #(CLK_PERIOD/2) clk = ~clk;

    // Instantiate DUT
    spi dut (
        .clk(clk),
        .reset_n(reset_n),
        .sck(sck),
        .sdo(sdo),
        .audio_valid(audio_valid),
        .pcm_out(pcm_out)            // *** FIXED ***
    );

    // ==========================
    //  TASKS
    // ==========================

    // Generate SCK pulse
    task sck_pulse();
        sck = 1'b0;
        #(SCK_PERIOD/2);
        sck = 1'b1;
        #(SCK_PERIOD/2);
    endtask

    // Send single audio sample (one system clock pulse)
    task send_audio_sample(input logic [15:0] data);
        @(posedge clk);
        pcm_out     <= data;        // *** FIXED ***
        audio_valid <= 1'b1;
        @(posedge clk);
        audio_valid <= 1'b0;
    endtask

    // Shift out and capture 16 bits
    task shift_out_16bits(output logic [15:0] received_data);
        int i;
        received_data = 16'h0000;
        for (i = 0; i < 16; i++) begin
            sck = 1'b0;
            #(SCK_PERIOD/2);
            sck = 1'b1;
            received_data = {received_data[14:0], sdo};
            #(SCK_PERIOD/2);
        end
        sck = 1'b0;
        #(SCK_PERIOD);
    endtask

    // ==========================
    //  TEST SEQUENCE
    // ==========================

    logic [15:0] received_data;
    logic [15:0] test_vectors [0:4];
    logic [3:0]  first_bits;
    int errors;

    initial begin
        // Init
        clk = 0;
        sck = 0;
        reset_n = 0;
        audio_valid = 0;
        pcm_out = 16'h0000;
        errors = 0;

        // Test vectors
        test_vectors[0] = 16'hA5A5;
        test_vectors[1] = 16'h5A5A;
        test_vectors[2] = 16'hFFFF;
        test_vectors[3] = 16'h0000;
        test_vectors[4] = 16'h1234;

        // Reset DUT
        #(CLK_PERIOD*10);
        reset_n = 1;
        #(CLK_PERIOD*10);

        $display("=== SPI Module Testbench ===\n");

        // -------------------------
        // Test 1
        // -------------------------
        $display("Test 1: Basic 16-bit transfer");
        send_audio_sample(test_vectors[0]);
        #(CLK_PERIOD*5);
        shift_out_16bits(received_data);

        if (received_data === test_vectors[0])
            $display("  PASS\n");
        else begin
            $display("  FAIL: expected 0x%04h, got 0x%04h\n",
                     test_vectors[0], received_data);
            errors++;
        end

        // -------------------------
        // Test 2
        // -------------------------
        $display("Test 2: Multiple consecutive transfers");
        for (int i = 1; i < 5; i++) begin
            send_audio_sample(test_vectors[i]);
            #(CLK_PERIOD*5);
            shift_out_16bits(received_data);

            if (received_data === test_vectors[i])
                $display("  PASS (%0d)", i);
            else begin
                $display("  FAIL %0d: expected 0x%04h, got 0x%04h",
                         i, test_vectors[i], received_data);
                errors++;
            end
        end
        $display("");

        // -------------------------
        // Test 3
        // -------------------------
        $display("Test 3: First-bit timing");
        send_audio_sample(16'h8000);
        #(CLK_PERIOD*2);

        if (sdo === 1'b1)
            $display("  PASS - MSB available immediately\n");
        else begin
            $display("  FAIL - MSB not present on sdo\n");
            errors++;
        end

        shift_out_16bits(received_data);

        // -------------------------
        // Test 4
        // -------------------------
        $display("Test 4: MSB-first order");
        send_audio_sample(16'b1000_0000_0000_0001);
        #(CLK_PERIOD*5);

        // Manually collect first 4 bits
        for (int i = 0; i < 4; i++) begin
            sck = 0;
            #(SCK_PERIOD/2);
            sck = 1;
            first_bits[3-i] = sdo;
            #(SCK_PERIOD/2);
        end

        $display("  First 4 bits = %b", first_bits);

        if (first_bits === 4'b1000)
            $display("  PASS\n");
        else begin
            $display("  FAIL - expected 1000\n");
            errors++;
        end

        // Finish shifting the rest
        for (int i = 0; i < 12; i++) sck_pulse();
        sck = 0;

        // -------------------------
        // Test 5
        // -------------------------
        $display("Test 5: Back-to-back transfers");

        send_audio_sample(16'hAAAA);
        #(CLK_PERIOD*3);
        shift_out_16bits(received_data);

        if (received_data === 16'hAAAA)
            $display("  PASS 1\n");
        else begin
            $display("  FAIL 1\n");
            errors++;
        end

        send_audio_sample(16'h5555);
        #(CLK_PERIOD*3);
        shift_out_16bits(received_data);

        if (received_data === 16'h5555)
            $display("  PASS 2\n");
        else begin
            $display("  FAIL 2\n");
            errors++;
        end

        // -------------------------
        // Test 6
        // -------------------------
        $display("Test 6: Partial shift recovery");

        send_audio_sample(16'hBEEF);
        #(CLK_PERIOD*5);

        // Only shift 8 bits
        repeat (8) sck_pulse();
        sck = 0;
        $display("  Stopped after 8 bits");

        #(CLK_PERIOD*10);
        send_audio_sample(16'hCAFE);
        #(CLK_PERIOD*5);
        shift_out_16bits(received_data);

        if (received_data === 16'hCAFE)
            $display("  PASS - recovered\n");
        else begin
            $display("  FAIL\n");
            errors++;
        end

        // -------------------------
        // Test 7
        // -------------------------
        $display("Test 7: Idle state");
        #(CLK_PERIOD*100);

        if (sdo == 0)
            $display("  PASS - idle low\n");
        else begin
            $display("  FAIL - idle not low\n");
            errors++;
        end

        // Summary
        $display("=== Summary ===");
        if (errors == 0)
            $display("All tests PASSED!");
        else
            $display("%0d test(s) FAILED", errors);

        #(CLK_PERIOD*10);
        $finish;
    end

    // Debug monitor
    always @(posedge sck or negedge sck)
        if ($time > 0)
            $display("[%0t] sck=%b sdo=%b audio_valid=%b pcm_out=0x%04h",
                     $time, sck, sdo, audio_valid, pcm_out);

    // Timeout
    initial begin
        #(CLK_PERIOD * 100000);
        $display("ERROR: Simulation timeout!");
        $finish;
    end

endmodule
