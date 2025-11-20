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
    input  logic        sdone,          // unused (for future expansion)
    output logic        sdo
);
    
    logic signed [15:0] cic_out, hb1_out, hb2_out, hb3_out;
    logic               cic_out_valid, hb1_out_valid, hb2_out_valid, hb3_out_valid;
    logic               pdm_data_sync;
    
    // Generate 1.536 MHz clock
    clk_gen clk_generator (
        .reset_n(reset_n),
        .clk_out(clk)
    );
    
    // Synchronize PDM data to avoid metastability
    synchronizer pdm_synchronizer (
        .clk(clk),
        .reset_n(reset_n),
        .async_in(pdm_data),
        .sync_out(pdm_data_sync)
    );
    
    // CIC decimation: 1.536 MHz -> 128 kHz
    cic cic_decimator (
        .clk(clk),
        .rst_n(reset_n),
        .pdm_in(pdm_data_sync),
        .dout(cic_out),
        .dout_valid(cic_out_valid)
    );
    
    // Halfband 1: 128 kHz -> 64 kHz
    hb1 halfband1 (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(cic_out),
        .x_in_valid(cic_out_valid),
        .y_out(hb1_out),
        .y_out_valid(hb1_out_valid)
    );
    
    // Halfband 2: 64 kHz -> 32 kHz
    hb2 halfband2 (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb1_out),
        .x_in_valid(hb1_out_valid),
        .y_out(hb2_out),
        .y_out_valid(hb2_out_valid)
    );
    
    // Halfband 3: 32 kHz -> 16 kHz
    hb3 halfband3 (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb2_out),
        .x_in_valid(hb2_out_valid),
        .y_out(hb3_out),
        .y_out_valid(hb3_out_valid)
    );
    
    // FIR filter: compensate for passband droop
    fir generic_fir (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb3_out),
        .x_in_valid(hb3_out_valid),
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