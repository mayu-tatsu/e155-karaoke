// karaoke_top.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-15

module karaoke_top (
    input  wire        pdm_clk,
    input  wire        reset_n,
    input  wire        pdm_data,
    output wire [15:0] audio_sample,
    output wire        audio_valid
);
    
    // use default params (no normalization)
    cic cic_decimator (
        .clk(pdm_clk),
        .rst_n(reset_n),
        .pdm_in(pdm_data),
        .dout(audio_sample),
        .dout_valid(audio_valid)
    );

    /*  // skeleton instantiations for next filters 
    // halfband x4
    halfband_filter my_hb_filter (
        .clk(pdm_clk),
        .rst_n(reset_n),
        .din(audio_sample),
        .din_valid(audio_valid),
        .dout(),            // connect to next stage or output as needed
        .dout_valid()      // connect to next stage or output as needed
    );

    // halfband x3
    halfband_filter my_hb_filter_2 (
        .clk(pdm_clk),
        .rst_n(reset_n),
        .din(),            // connect to previous stage output
        .din_valid(),      // connect to previous stage valid
        .dout(),           // connect to next stage or output as needed
        .dout_valid()      // connect to next stage or output as needed
    );

    // fir x1, just fixing drooping and attenuation
    fir_filter my_fir_filter (
        .clk(pdm_clk),
        .rst_n(reset_n),
        .din(),            // connect to previous stage output
        .din_valid(),      // connect to previous stage valid
        .dout(),           // final audio output
        .dout_valid()      // final audio valid
    );

    */
endmodule