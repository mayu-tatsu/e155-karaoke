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
    logic [15:0] pcm_out;
    
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
        .pcm_out(pcm_out)
    );
    
    // Task: Generate SCK pulses
    task sck_pulse();
        sck = 1'b0;
        #(SCK_PERIOD/2);
        sck = 1'b1;
        #(SCK_PERIOD/2);
    endtask
    
    // Task: Pulse audio_valid for one clk cycle
    task send_audio_sample(input logic [15:0] data);
        @(posedge clk);
        pcm_out <= data;
        audio_valid <= 1'b1;
        @(posedge clk);
        audio_valid <= 1'b0;
    endtask
    
    // Task: Shift out and capture 16 bits from SPI
    task shift_out_16bits(output logic [15:0] received_data);
        int i;
        received_data = 16'h0000;
        
        for (i = 0; i < 16; i++) begin
            // Sample on rising edge (CPHA=0, CPOL=0)
            sck = 1'b0;
            #(SCK_PERIOD/2);
            sck = 1'b1;
            received_data = {received_data[14:0], sdo};  // Shift in MSB first
            #(SCK_PERIOD/2);
        end
        
        // Return to idle
        sck = 1'b0;
        #(SCK_PERIOD);
    endtask
    
    // Test sequence
    logic [15:0] received_data;
    logic [15:0] test_vectors [0:4];
    int errors;
    
    initial begin
        // Initialize
        clk = 0;
        sck = 0;
        reset_n = 0;
        audio_valid = 0;
        pcm_out = 16'h0000;
        errors = 0;
        
        // Define test vectors
        test_vectors[0] = 16'hA5A5;  // Alternating pattern
        test_vectors[1] = 16'h5A5A;  // Inverse alternating
        test_vectors[2] = 16'hFFFF;  // All ones
        test_vectors[3] = 16'h0000;  // All zeros
        test_vectors[4] = 16'h1234;  // Arbitrary pattern
        
        // Reset
        #(CLK_PERIOD*10);
        reset_n = 1;
        #(CLK_PERIOD*10);
        
        $display("=== SPI Module Testbench ===\n");
        
        // Test 1: Basic transfer
        $display("Test 1: Basic 16-bit transfer");
        $display("  Sending: 0x%04h", test_vectors[0]);
        send_audio_sample(test_vectors[0]);
        #(CLK_PERIOD*5);  // Wait for audio_valid to propagate
        shift_out_16bits(received_data);
        $display("  Received: 0x%04h", received_data);
        if (received_data === test_vectors[0])
            $display("  PASS\n");
        else begin
            $display("  FAIL - Expected 0x%04h, got 0x%04h\n", test_vectors[0], received_data);
            errors++;
        end
        
        // Test 2: Multiple consecutive transfers
        $display("Test 2: Multiple consecutive transfers");
        for (int i = 1; i < 5; i++) begin
            $display("  Transfer %0d: Sending 0x%04h", i, test_vectors[i]);
            send_audio_sample(test_vectors[i]);
            #(CLK_PERIOD*5);
            shift_out_16bits(received_data);
            $display("  Received: 0x%04h", received_data);
            if (received_data === test_vectors[i])
                $display("  PASS");
            else begin
                $display("  FAIL - Expected 0x%04h, got 0x%04h", test_vectors[i], received_data);
                errors++;
            end
        end
        $display("");
        
        // Test 3: Timing - First bit availability
        $display("Test 3: First bit timing (MSB available immediately)");
        send_audio_sample(16'h8000);  // MSB = 1, rest = 0
        #(CLK_PERIOD*2);  // Small delay
        $display("  audio_valid asserted, checking sdo immediately...");
        if (sdo === 1'b1)
            $display("  PASS - MSB available immediately\n");
        else begin
            $display("  FAIL - MSB not available immediately (sdo=%b)\n", sdo);
            errors++;
        end
        shift_out_16bits(received_data);  // Complete the transfer
        
        // Test 4: Verify MSB-first transmission
        $display("Test 4: MSB-first transmission order");
        send_audio_sample(16'b1000_0000_0000_0001);
        #(CLK_PERIOD*5);
        
        // Manually check first few bits
        logic [3:0] first_bits;
        for (int i = 0; i < 4; i++) begin
            sck = 1'b0;
            #(SCK_PERIOD/2);
            sck = 1'b1;
            first_bits[3-i] = sdo;
            #(SCK_PERIOD/2);
        end
        
        $display("  First 4 bits received: %b", first_bits);
        if (first_bits === 4'b1000)
            $display("  PASS - MSB transmitted first\n");
        else begin
            $display("  FAIL - Expected 1000, got %b\n", first_bits);
            errors++;
        end
        
        // Complete the transfer
        for (int i = 0; i < 12; i++) begin
            sck_pulse();
        end
        sck = 1'b0;
        
        // Test 5: Back-to-back with minimal delay
        $display("Test 5: Back-to-back transfers");
        send_audio_sample(16'hAAAA);
        #(CLK_PERIOD*3);
        shift_out_16bits(received_data);
        if (received_data === 16'hAAAA)
            $display("  Transfer 1: PASS (0x%04h)", received_data);
        else begin
            $display("  Transfer 1: FAIL");
            errors++;
        end
        
        // Immediate next transfer
        send_audio_sample(16'h5555);
        #(CLK_PERIOD*3);
        shift_out_16bits(received_data);
        if (received_data === 16'h5555)
            $display("  Transfer 2: PASS (0x%04h)\n", received_data);
        else begin
            $display("  Transfer 2: FAIL\n");
            errors++;
        end
        
        // Test 6: Partial shift (incomplete transfer)
        $display("Test 6: Partial shift handling");
        send_audio_sample(16'hBEEF);
        #(CLK_PERIOD*5);
        
        // Only shift out 8 bits
        for (int i = 0; i < 8; i++) begin
            sck_pulse();
        end
        sck = 1'b0;
        $display("  Shifted only 8 bits, then stopped");
        
        // Start new transfer
        #(CLK_PERIOD*10);
        send_audio_sample(16'hCAFE);
        #(CLK_PERIOD*5);
        shift_out_16bits(received_data);
        $display("  New transfer after partial: 0x%04h", received_data);
        if (received_data === 16'hCAFE)
            $display("  PASS - New transfer works after incomplete previous transfer\n");
        else begin
            $display("  FAIL\n");
            errors++;
        end
        
        // Test 7: Idle state check
        $display("Test 7: Idle state (sdo should be low when not transmitting)");
        #(CLK_PERIOD*100);
        if (sdo === 1'b0)
            $display("  PASS - sdo idle low\n");
        else begin
            $display("  FAIL - sdo not idle low\n");
            errors++;
        end
        
        // Summary
        $display("=== Test Summary ===");
        if (errors == 0)
            $display("All tests PASSED!");
        else
            $display("%0d test(s) FAILED", errors);
        
        #(CLK_PERIOD*10);
        $finish;
    end
    
    // Monitor for debugging
    always @(posedge sck or negedge sck) begin
        if ($time > 0)  // Ignore time 0
            $display("[%0t] sck=%b sdo=%b audio_valid=%b pcm_out=0x%04h", 
                     $time, sck, sdo, audio_valid, pcm_out);
    end
    
    // Timeout watchdog
    initial begin
        #(CLK_PERIOD * 100000);
        $display("ERROR: Simulation timeout!");
        $finish;
    end

endmodule