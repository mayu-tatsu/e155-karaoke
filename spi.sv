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

module spi(input logic clk,
		   input logic reset_n,
		   input  logic sck, 
           output logic sdo,
           input  logic audio_valid,	// done!!!
           input  logic [15:0] pcm_out
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
    
    // when done/audio_valid is first asserted, shift out msb before clock edge
    assign sdo = (audio_valid & !wasdone) ? pcm_out[15] : sdodelayed;
endmodule