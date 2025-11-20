// cic.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-15

// CIC decimator
// Inputs:
//      - 1-bit PDM stream (pdm_in)
//      - microphone clock (pdm_clk)
// Outputs:
//     - decimated output (dout) at pdm_clk / R
//     - valid strobe (dout_valid) indicating new output sample

// maps pdm_in = 1 -> +1, pdm_in = 0 -> -1 (signed).
// normalization is resource-heavy (at least 1 DSP block) -> optional.
// IMPORTANT: in software, remember to divide samples by 20736 to get actual audio values

// Based on this Scala (SpinalHDL) reference: https://github.dev/tomverbeure/pdm/tree/master/modeling/pdm2pcm

module cic #(
    parameter int R           = 24,      // decimation factor, default 24
    parameter int N           = 4,       // # stages, default 6
    parameter int M           = 1,       // differential delay (comb), default 1
    parameter int OUT_WIDTH   = 16,      // desired output width
    parameter bit NORMALIZE   = 0        // enable normalization to compensate CIC gain, default off
) (
    input  logic                        clk,        // pdm clock
    input  logic                        reset_n,    // active-low reset
    input  logic                        pdm_in,     // 1-bit PDM data at clk
    output logic signed [OUT_WIDTH-1:0] dout,       // decimated (and optionally normalized) output
    output logic                        dout_valid  // pulses high for one clk when dout is valid
);

    // required # of bits (accumulated) = input (1bit) + roundUp(nrStages * log2(decimation))
    // nrBits = 1 + (4 * log2Up(24)) = 1 + roundUp(4 * 5) = 1 + 20 = 21
    localparam ACC_WIDTH = 21;
    localparam GAIN_INT  = 331776; // (R*M)^N = (24*1)^4 = 331776


    // mapping PDM (1-bit alternating input): 0 -> -1, 1 -> +1 (SIGNED REPRESENTATION)
    logic      signed [1:0] pdm_sample;
    localparam signed [1:0] POS_ONE = 2'sd1;   // 01 = +1
    localparam signed [1:0] MIN_ONE = -2'sd1;  // 11 = -1
    assign pdm_sample = pdm_in ? POS_ONE : MIN_ONE;


    // integrator stages (runs on input/PDM clk)
    logic signed [ACC_WIDTH-1:0] integrator [0:N-1];    // 4 integrator registers of 17 bits each

    int i;
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            for (i = 0; i < N; i = i + 1) integrator[i] <= '0;
        end else begin
            // first [0] integrator adds pdm sample (sign-extended)
            integrator[0] <= integrator[0] + $signed(pdm_sample);
            // cascade
            for (i = 1; i < N; i = i + 1) begin
                integrator[i] <= integrator[i] + integrator[i-1];
            end
        end
    end


    // decimator counter
    // picks one sample out of every R=24 clks
    logic [$clog2(R)-1:0] decim_cnt;
    logic signed [ACC_WIDTH-1:0] decim_sample;  // sample from integrator every R=24 clk
    logic new_decim_valid;                      // pulse for new decimated sample available

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            decim_cnt <= '0;
            decim_sample <= '0;
            new_decim_valid <= 1'b0;
        end else begin
            if (decim_cnt == R-1) begin
                decim_cnt <= 0;
                decim_sample <= integrator[N-1];
                new_decim_valid <= 1'b1;
            end else begin
                decim_cnt <= decim_cnt + 1;
                new_decim_valid <= 1'b0;
            end
        end
    end


    // comb stages (runs on decimated sample rate)
    // each stage: y[n] = x[n] - x[n-M] ... note: M = 1 here
    logic signed [ACC_WIDTH-1:0] comb_delay [0:N-1][0:M-1]; 
    logic signed [ACC_WIDTH-1:0] comb_in;
    logic signed [ACC_WIDTH-1:0] comb_out;

    // valid output of comb chain
    logic combs_output_vld;

    // avoiding declarations in ifs and loops (for later)
    logic signed [ACC_WIDTH-1:0] delayed_temp;      // delayed sample (M=1 samples ago)
    logic signed [ACC_WIDTH-1:0] diff_temp;         // difference: y[n] = x[n] - x[n-M]

    // sequential comb filter runs if new_decim_valid is asserted
    int si, dj;
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            
            // clearing delay lines and comb registers
            for (si = 0; si < N; si = si + 1) begin
                for (dj = 0; dj < M; dj = dj + 1)
                    comb_delay[si][dj] <= '0;
            end
            
            comb_out         <= '0;
            combs_output_vld <= 1'b0;

        end else begin

            // default: no new output unless decimated sample arrives
            combs_output_vld <= 1'b0;

            if (new_decim_valid) begin
                // stage 0 input comes from CIC integrator output (decimated sample)
                comb_in = decim_sample;

                // cascading N=4 comb stages
                for (si = 0; si < N; si = si + 1) begin
                    delayed_temp = comb_delay[si][M-1];
                    diff_temp = comb_in - delayed_temp;

                    // shift delay line: newest sample becomes delay[si][0]
                    for (dj = M-1; dj > 0; dj = dj - 1)
                        comb_delay[si][dj] <= comb_delay[si][dj-1];
                    comb_delay[si][0] <= comb_in;

                    // next stage input
                    comb_in = diff_temp;
                end

                // final outputs (at stage N-1 = 3):
                comb_out         <= comb_in;
                combs_output_vld <= 1'b1;
            end
        end
    end


    // OUTPUT ASSIGNMENTS & optional normalization (assign as param)
    localparam int SCALE_FRAC = 24;     // fractional bits used in reciprocal multiplier, u can choose but 24 is good balance
    localparam int RECIPROCAL = 51;    // reciprocal = round(2^SCALE_FRAC / GAIN_INT) = round(2^24 / 331776) = 51

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            dout <= '0;
            dout_valid <= 1'b0;
        end else if (combs_output_vld) begin
            if (NORMALIZE) begin                    // Multiply by reciprocal and shift
                dout <= $signed( comb_out * RECIPROCAL >>> SCALE_FRAC );
            end else begin                          // just truncate or extend to match OUT_WIDTH
                dout <= comb_out[ACC_WIDTH-1 -: OUT_WIDTH]; // MSBs kept
            end
            dout_valid <= 1'b1;
        end else begin
            dout_valid <= 1'b0;
        end
    end

endmodule
