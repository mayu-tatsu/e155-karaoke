// karaoke_top.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-15

// Takes in a PDM from a digital microphone and decimates it from
// 1.536 MHz down to a 16 kHz PCM. Outputs a 16-bit audio sample
// which is indicated by audio_valid through SPI to the MCU.

module karaoke_top (
    input  logic        pdm_data,       // from the microphone
    input  logic        reset_n,        // active-low reset from board

    output logic        clk,            // goes to the microphone
    output logic [15:0] audio_sample,   // unused (for debugging)
    output logic        audio_valid,    // unused (for debugging)

    output logic        sck,            // to MCU (SPI SCK)
    output logic        sdo,            // to MCU (MOSI)
	output logic 		 led			 // for debugging
);

	assign led = audio_valid;
    
    logic pdm_data_sync;
    logic clk_6mhz;       // 6 MHz clock for SPI
	
	logic signed [15:0] cic_out, hb_out;
    logic               cic_out_valid, hb_out_valid;
    
    
    // Generate 1.536 MHz clock
    clk_gen clk_generator (
        .reset_n(reset_n),
        .clk_out(clk),
        .clk_6mhz(clk_6mhz)
    );
    
    // Synchronize PDM data
    synchronizer pdm_synchronizer (
        .clk(clk),
        .reset_n(reset_n),
        .async_in(pdm_data),
        .sync_out(pdm_data_sync)
    );
    
	// CIC decimation by 24: 1.536 MHz -> 64 kHz
    cic cic_decimator (
        .clk(clk),
        .reset_n(reset_n),

        .pdm_in(pdm_data_sync),

        .dout(cic_out),
        .dout_valid(cic_out_valid)
    );
	
    // Halfband decimation by 2: 64 kHz -> 32 kHz
    hb halfband (
        .clk(clk),
        .reset_n(reset_n),

        .x_in(cic_out),
        .x_in_valid(cic_out_valid),

        .y_out(hb_out),
        .y_out_valid(hb_out_valid)
    );
    
    // FIR decimation by 2: 32 kHz -> 16 kHz 
    // also covers passband droop & stopband attenuation
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
        .clk_6mhz(clk_6mhz),
        .reset_n(reset_n),

        .audio_valid(audio_valid),
        .pcm_out(audio_sample),

        .sck(sck),
        .sdo(sdo)
    );
    
endmodule