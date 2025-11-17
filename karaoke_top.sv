// karaoke_top.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-15

module karaoke_top (
    input  logic        pdm_data,
    input  logic        reset_n,
    output logic        clk,                // goes to the microphone
    output logic [15:0] audio_sample,
    output logic        audio_valid
);
    

    clk_gen clk(reset_n, clk);

    // use default params (no normalization)
    cic cic_decimator (
        .clk(clk),
        .rst_n(reset_n),
        .pdm_in(pdm_data),
        .dout(cic_out),
        .dout_valid(cic_out_valid)
    );

    // halfband x4
    hb1 halfbandx4 (
        .clk(clk),
        .rst_n(reset_n),
        .x_in(cic_out),
        .y_out(hb1_out)
    );

    // halfband x3
    hb2 halfbandx3 (
        .clk(clk),
        .rst_n(reset_n),
        .x_in(hb1_out),
        .y_out(hb2_out)
    );

    // fir x1, fixing drooping and attenuation
    fir generic_fir (
        .clk(clk),
        .rst_n(reset_n),
        .noisy_signal(hb2_out),
        .filtered_signal(audio_sample)
    );
endmodule