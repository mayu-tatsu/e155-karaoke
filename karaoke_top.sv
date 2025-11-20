// karaoke_top.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-15

module karaoke_top (
    input  logic        pdm_data,       // from the microphone
    input  logic        reset_n,
    output logic        clk,            // goes to the microphone
    output logic [15:0] audio_sample,
    output logic        audio_valid,

    input  logic sck,                   // clk input from MCU
    input  logic sdi,
    input  logic sdone,                 // from the MCU to indicate data is read
    output logic sdo
);
    
    logic signed [15:0] cic_out, hb1_out, hb2_out;
    logic               cic_out_valid, hb1_out_valid, hb2_out_valid;

    // outputs 1.536 MHz (to be divided down)
    clk_gen clk_generator(reset_n, clk);

    synchronizer pdm_synchronizer (
        .clk(clk),
        .reset_n(reset_n),
        .async_in(pdm_data),
        .sync_out(pdm_data_sync)
    );

    // use default params (no normalization)
    // 1.536 -> 128 kHz
    cic cic_decimator (
        .clk(clk),
        .rst_n(reset_n),
        .pdm_in(pdm_data_sync),
        .dout(cic_out),
        .dout_valid(cic_out_valid)
    );

    // halfband x2
    // 128 kHz -> 64 kHz
    hb1 halfband1 (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(cic_out),
        .x_in_valid(cic_out_valid),
        .y_out(hb1_out),
        .y_out_valid(hb1_out_valid)
    );

    // halfband x2
    // 64 kHz -> 32 kHz
    hb2 halfband2 (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb1_out),
        .x_in_valid(hb1_out_valid),
        .y_out(hb2_out),
        .y_out_valid(hb2_out_valid)
    );

    // halfband x2
    // 32 kHz -> 16 kHz
    hb3 halfband3 (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb2_out),
        .x_in_valid(hb2_out_valid),
        .y_out(hb3_out),
        .y_out_valid(hb3_out_valid)
    );

    // fir x1, fixing drooping and attenuation
    fir generic_fir (
        .clk(clk),
        .reset_n(reset_n),
        .x_in(hb3_out),
        .x_in_valid(hb3_out_valid),
        .y_out(audio_sample),
        .y_out_valid(audio_valid)
    );

    // SPI out to MCU
    // send out audio_sample based on audio_valid pulse
    logic [2:0] audio_valid_stretch;
    
    // Stretch audio_valid pulse to 3 clock cycles (1.3 µs)
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            audio_valid_stretch <= 3'b000;
        else
            audio_valid_stretch <= {audio_valid_stretch[1:0], audio_valid};
    end
    
    logic audio_valid_stretched;
    assign audio_valid_stretched = |audio_valid_stretch;

    spi spi_interface (
        .sck(sck),
        .sdi(sdi),
        .sdo(sdo),  
        .sdone(sdone),
        .pcm_out(audio_sample)
        // .audio_valid(audio_valid_stretched)
    );
endmodule