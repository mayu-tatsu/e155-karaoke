// spi.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-20

/////////////////////////////////////////////
// aes_spi
//   SPI interface.  Shifts in key and plaintext
//   Captures ciphertext when done, then shifts it out
//   Tricky cases to properly change sdo on negedge clk
/////////////////////////////////////////////

module spi(
    input  logic        clk,          // 1.536 MHz FPGA clock
    input  logic        reset_n,
    input  logic        sck,          // SPI clock from MCU
    output logic        sdo,
    input  logic        audio_valid,  // In clk domain
    input  logic [15:0] pcm_out,      // In clk domain
    output logic        led
);

    // ========================================
    // Clock Domain Crossing: clk â†’ sck
    // ========================================
    
    // Capture audio data in clk domain
    logic [15:0] pcm_captured;
    logic        data_ready;
    
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            pcm_captured <= 16'b0;
            data_ready   <= 1'b0;
        end else if (audio_valid) begin
            pcm_captured <= pcm_out;
            data_ready   <= 1'b1;  // Will stay high until sck domain clears it
        end
    end
    
    // Synchronize data_ready to sck domain (2-FF synchronizer)
    logic data_ready_sync1, data_ready_sync2, data_ready_prev;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            data_ready_sync1 <= 1'b0;
            data_ready_sync2 <= 1'b0;
            data_ready_prev  <= 1'b0;
        end else begin
            data_ready_sync1 <= data_ready;
            data_ready_sync2 <= data_ready_sync1;
            data_ready_prev  <= data_ready_sync2;
        end
    end
    
    // Detect rising edge of data_ready in sck domain
    logic new_data;
    assign new_data = data_ready_sync2 & ~data_ready_prev;
    
    // ========================================
    // SPI Shift Register (in sck domain)
    // ========================================
    
    logic [15:0] shift_reg;
    logic [4:0]  bit_count;  // 0-15 for 16 bits
    logic        shifting;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            shift_reg <= 16'b0;
            bit_count <= 5'd0;
            shifting  <= 1'b0;
        end else begin
            if (new_data && !shifting) begin
                // Load new data (safe because pcm_captured is stable)
                shift_reg <= pcm_captured;
                bit_count <= 5'd15;  // Will send bits 15 down to 0
                shifting  <= 1'b1;
            end else if (shifting && (bit_count > 0)) begin
                // Shift left, sending MSB first
                shift_reg <= {shift_reg[14:0], 1'b0};
                bit_count <= bit_count - 1'b1;
            end else if (shifting && (bit_count == 0)) begin
                // Last bit has been loaded into output register
                shifting <= 1'b0;
            end
        end
    end
    
    // ========================================
    // Output Register (changes on negedge)
    // ========================================
    
    logic sdo_reg;
    
    always_ff @(negedge sck or negedge reset_n) begin
        if (~reset_n) begin
            sdo_reg <= 1'b0;
        end else begin
            sdo_reg <= shift_reg[15];  // Output MSB
        end
    end
    
    assign sdo = sdo_reg;
    
    // ========================================
    // LED Indicator
    // ========================================
    
    assign led = (pcm_out == 16'hFF);
    
endmodule


/*
module spi(input logic clk,
		   input logic reset_n,
		   input  logic sck, 
           output logic sdo,
           input  logic audio_valid,	// done!!!
           input  logic [15:0] pcm_out,
		   
		   output led
);

    logic        sdodelayed, wasdone;
    logic [15:0] pcmStateCaptured;
               
    // assert load
    // apply 256 sclks to shift in key and plaintext, starting with plaintext[127]
    // then deassert load, wait until done
    // then apply 128 sclks to shift out cyphertext, starting with cyphertext[127]
    // SPI mode is equivalent to cpol = 0, cpha = 0 since data is sampled on first edge and the first
    // edge is a rising edge (clock going from low in the idle state to high).
    always_ff @(posedge sck)
        if (!wasdone)  pcmStateCaptured = pcm_out;
        else          {pcmStateCaptured} = {pcmStateCaptured[14:0], 1'b1}; 
    
    // sdo should change on the negative edge of sck
    always_ff @(negedge sck) begin
        wasdone = audio_valid;
        sdodelayed = pcmStateCaptured[14];
    end
	
	assign led = (pcm_out == 'hFF);

    
    // when done/audio_valid is first asserted, shift out msb before clock edge
    assign sdo = (audio_valid & !wasdone) ? pcm_out[15] : sdodelayed;
	// assign sdo = 0;
endmodule*/