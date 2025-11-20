// karaoke_top.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-15

// Takes in a PDM from a digital microphone and decimates it from
// 1.536 MHz down to a 16 kHz PCM. Outputs a 16-bit audio sample
// which is indicated by audio_valid through SPI to the MCU.

module karaoke_top (
    input  logic        pdm_data,       // from the microphone
    input  logic        reset_n,
    output logic        clk,            // goes to the microphone
    output logic [15:0] audio_sample,
    output logic        audio_valid,
    input  logic        sck,            // clk input from MCU
    input  logic        sdi,            // unused (for future expansion)
    output logic        done,          // unused (for future expansion)
    output logic        sdo
);
    
    logic               pdm_data_sync;
	
	logic signed [15:0] cic_out, hb_out;
    logic               cic_out_valid, hb_out_valid;
    
    
    // Generate 1.536 MHz clock
    clk_gen clk_generator (
        .reset_n(reset_n),
        .clk_out(clk)
    );
    
    // Synchronize PDM data
    synchronizer pdm_synchronizer (
        .clk(clk),
        .reset_n(reset_n),
        .async_in(pdm_data),
        .sync_out(pdm_data_sync)
    );
    
	// NEW: CIC decimation by 24: 1.536 MHz -> 64 kHz
    cic cic_decimator (
        .clk(clk),
        .reset_n(reset_n),
        .pdm_in(pdm_data_sync),
        .dout(cic_out),
        .dout_valid(cic_out_valid)
    );
	
    // Halfband: 64 kHz -> 32 kHz
    hb halfband (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(cic_out),
        .x_in_valid(cic_out_valid),
        .y_out(hb_out),
        .y_out_valid(hb_out_valid)
    );
    
    // FIR: 32 kHz -> 16 kHz & passband droop & stopband attenuation
    fir generic_fir (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb_out),
        .x_in_valid(hb_out_valid),
        .y_out(audio_sample),
        .y_out_valid(audio_valid)
    );
	
    // SPI interface to MCU
    spi spi_interface (
        .clk(clk), 
        .reset_n(reset_n),
        .pcm_out(audio_sample),
        .audio_valid(audio_valid),
        .sck(sck),
        .sdo(sdo)
    );
    
endmodule