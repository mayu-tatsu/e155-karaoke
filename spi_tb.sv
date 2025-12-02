`timescale 1ns / 1ps

module spi_tb;

    // Clock and reset
    logic        clk;           // 1.536 MHz (period = 651.04 ns)
    logic        clk_6mhz;      // 6 MHz (period = 166.67 ns)
    logic        reset_n;
    
    // Audio interface
    logic        audio_valid;
    logic [15:0] pcm_out;
    
    // SPI interface
    logic        sck;
    logic        sdo;
    
    // DUT instantiation
    spi dut (
        .clk(clk),
        .clk_6mhz(clk_6mhz),
        .reset_n(reset_n),
        .audio_valid(audio_valid),
        .pcm_out(pcm_out),
        .sck(sck),
        .sdo(sdo)
    );
    
    // Clock generation
    // 1.536 MHz clock (period = 651.04 ns)
    initial begin
        clk = 0;
        forever #325.52 clk = ~clk;  // Half period = 325.52 ns
    end
    
    // 6 MHz clock (period = 166.67 ns)
    initial begin
        clk_6mhz = 0;
        forever #83.33 clk_6mhz = ~clk_6mhz;  // Half period = 83.33 ns
    end
    
    // Task to send audio sample
    task send_audio_sample(input [15:0] data);
        begin
            pcm_out = data;
            @(posedge clk);
            audio_valid = 1'b1;
            @(posedge clk);
            audio_valid = 1'b0;
            $display("[%0t] Sent audio sample: 0x%04h", $time, data);
        end
    endtask
    
    // Task to monitor SPI transmission
    // Note: Variables are now LOCAL (automatic) to avoid race conditions
    task monitor_spi_transmission();
        logic [15:0] received_data;  // LOCAL to this task call
        int bit_index;               // LOCAL to this task call
        begin
            received_data = 16'h0000;
            bit_index = 15;
            
            $display("[%0t] Waiting for SPI transmission to start...", $time);
            
            // Wait for SCK to go high (start of first bit in Mode 0)
            fork
                begin
                    @(posedge sck);
                    $display("[%0t] SPI transmission started", $time);
                end
                begin
                    #50000;  // 50us timeout for transmission start
                    $display("ERROR [%0t]: Timeout waiting for SPI transmission start", $time);
                    $finish;
                end
            join_any
            disable fork;
            
            // Capture 16 bits on rising edges
            for (int i = 0; i < 16; i++) begin
                received_data[bit_index] = sdo;
                $display("[%0t] Bit %0d captured: SDO=%b", $time, 15-bit_index, sdo);
                bit_index--;
                if (i < 15) @(posedge sck);  // Wait for next bit
            end
            
            $display("[%0t] === SPI transmission complete. Received: 0x%04h (binary: %016b) ===", 
                     $time, received_data, received_data);
        end
    endtask
    
    // Main test sequence
    initial begin
        // Initialize - CRITICAL: Set all inputs to known values
        reset_n = 0;
        audio_valid = 0;
        pcm_out = 16'h0000;
        
        // VCD dump for waveform viewing
        $dumpfile("spi_tb.vcd");
        $dumpvars(0, spi_tb);
        
        // Reset
        $display("========================================");
        $display("Starting SPI Testbench");
        $display("========================================");
        
        // Hold reset for several clock cycles
        repeat(10) @(posedge clk);
        reset_n = 1;
        $display("[%0t] Reset released", $time);
        
        // Wait for synchronizers to settle (important for CDC)
        repeat(20) @(posedge clk);
        $display("[%0t] Initialization complete, ready for tests", $time);
        
        // Test 1: Send single sample
        $display("\n--- Test 1: Single Sample Transmission ---");
        fork
            send_audio_sample(16'hA5A5);
            monitor_spi_transmission();
        join
        
        // Wait for transmission to complete
        repeat(50) @(posedge clk_6mhz);
        
        // Test 2: Send another sample with different pattern
        $display("\n--- Test 2: Second Sample Transmission ---");
        fork
            send_audio_sample(16'h5A5A);
            monitor_spi_transmission();
        join
        
        repeat(50) @(posedge clk_6mhz);
        
        // Test 3: Send all 1s
        $display("\n--- Test 3: All 1s Pattern ---");
        fork
            send_audio_sample(16'hFFFF);
            monitor_spi_transmission();
        join
        
        repeat(50) @(posedge clk_6mhz);
        
        // Test 4: Send all 0s
        $display("\n--- Test 4: All 0s Pattern ---");
        fork
            send_audio_sample(16'h0000);
            monitor_spi_transmission();
        join
        
        repeat(50) @(posedge clk_6mhz);
        
        // Test 5: Back-to-back samples at realistic 16 kHz rate (stress test)
        $display("\n--- Test 5: Realistic 16 kHz Sample Rate ---");
        $display("Expected: 62.5 us between samples (16 kHz)");
		
		
		begin
			send_audio_sample(16'h1234);
			#62500;  // 62.5 us delay (realistic 16 kHz rate)
			send_audio_sample(16'h5678);
			#62500;  // Another sample
			send_audio_sample(16'h9ABC);
		end
	
		/*
        fork
            begin
                send_audio_sample(16'h1234);
                #62500;  // 62.5 us delay (realistic 16 kHz rate)
                send_audio_sample(16'h5678);
                #62500;  // Another sample
                send_audio_sample(16'h9ABC);
            end
            begin
                monitor_spi_transmission();
                monitor_spi_transmission();
                monitor_spi_transmission();
            end
        join
        */
        repeat(100) @(posedge clk_6mhz);
        
        $display("\n========================================");
        $display("Testbench Complete");
        $display("========================================");
        $finish;
    end
    
    // Timeout watchdog
    initial begin
        #1000000;  // 1ms timeout
        $display("ERROR: Testbench timeout!");
        $finish;
    end
    
    // Monitor for SCK and SDO changes (only during active transmission)
    always @(posedge dut.busy) begin
        $display("[%0t] >>> SPI BUSY asserted, transmission starting", $time);
    end
    
    always @(negedge dut.busy) begin
        $display("[%0t] <<< SPI BUSY deasserted, transmission complete", $time);
    end
    
    // Check SPI Mode 0 compliance
    initial begin
        @(posedge reset_n);
        forever begin
            @(negedge reset_n or posedge sck);
            if (reset_n) begin
                // In Mode 0, SCK should be low when idle
                @(negedge dut.busy);
                #100;  // Wait a bit after transmission
                if (sck !== 1'b0) begin
                    $display("ERROR [%0t]: SCK not idle low (Mode 0 violation)!", $time);
                end
            end
        end
    end
    
    // Debug monitor for internal signals
    always @(posedge clk) begin
        if (reset_n && audio_valid) begin
            $display("[%0t DEBUG] audio_valid pulse detected in 1.536MHz domain", $time);
        end
    end
    
    always @(posedge clk_6mhz) begin
        if (reset_n && dut.new_request_6mhz) begin
            $display("[%0t DEBUG] new_request detected in 6MHz domain", $time);
        end
    end

endmodule