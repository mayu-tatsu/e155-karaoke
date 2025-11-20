// hb3.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16

// Halfband decimation filter

module hb3(
    input  logic clk,
    input  logic reset_n,
    input  logic signed [15:0] x_in,
    input  logic               x_in_valid,
    output logic signed [15:0] y_out,
    output logic               y_out_valid
);
    
    logic signed [15:0] taps [26:0];    // 27 taps
    logic signed [37:0] sum;
    logic signed [33:0] p[0:6];         // products used later, 7 non-zero unique coefficients
    
    logic [26:0] valid_reg;             // valid signal shift register
    logic        sample_counter;        // track decimation by 2

    // Q15 fixed-point coefficients (multiply by 32768 and round)
    // nonzero coefficients, symmetric
    const logic signed [15:0] w[0:6] = {
        16'sd3,    // h[0]  = +0.0000842821 * 32768 = 3
        -16'sd1047,   // h[2]  = -0.0007501700 * 32768 = -25
        16'sd1228,    // h[4]  = +0.0035653953 * 32768 = 117
        -16'sd1542,   // h[6]  = -0.0120179608 * 32768 = -394
        16'sd2122,    // h[8]  = +0.0328998968 * 32768 = 1078
        -16'sd3498,   // h[10] = -0.0840043501 * 32768 = -2753
        16'sd10437    // h[12] = +0.3102230762 * 32768 = 10165
    };

    // Center tap
    const logic signed [15:0] w13 = 16'sd16384; // h[13] = 0.5 * 32768
    
    // shift register for filter taps
    // also decimates
    int i;
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            for (i = 0; i < 27; i = i + 1)
                taps[i] <= 16'sd0;
            valid_reg <= '0;
            sample_counter <= 1'b0;
        end else if (x_in_valid) begin
            taps <= {taps[25:0], x_in};
            valid_reg <= {valid_reg[25:0], 1'b1};   // always shift 1 when valid input arrives
            sample_counter <= ~sample_counter;      // toggle for decimation
        end
    end

    // compute symmetric pairs and multiply by coefficients
    always_comb begin
        // symmetry: h[i] = h[26-i], nonzero
        p[0] = $signed(w[0]) * $signed(taps[0]  + taps[26]);
        p[1] = $signed(w[1]) * $signed(taps[2]  + taps[24]);
        p[2] = $signed(w[2]) * $signed(taps[4]  + taps[22]);
        p[3] = $signed(w[3]) * $signed(taps[6]  + taps[20]);
        p[4] = $signed(w[4]) * $signed(taps[8]  + taps[18]);
        p[5] = $signed(w[5]) * $signed(taps[10] + taps[16]);
        p[6] = $signed(w[6]) * $signed(taps[12] + taps[14]);
        
        // sum all products plus center tap
        sum = $signed(p[0]) + $signed(p[1]) + $signed(p[2]) + $signed(p[3])
            + $signed(p[4]) + $signed(p[5]) + $signed(p[6]) + $signed(w13) * $signed(taps[13]);
    end

    // output register with scaling (arithmetic right shift by 15 for Q15)
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            y_out <= 16'sd0;
            y_out_valid <= 1'b0;
        end else if (x_in_valid && sample_counter && valid_reg[26]) begin
            y_out <= sum >>> 15;  // multiplying two Q15 numbers results in Q30, shift back to Q15
            y_out_valid <= 1'b1;
        end else begin
            y_out_valid <= 1'b0;
        end
    end
    
endmodule