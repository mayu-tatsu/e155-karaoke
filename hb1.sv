// hb1.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16

module hb1(
    input  logic clk,
    input  logic reset_n,
    input  logic signed [15:0] x_in,    
    output logic signed [15:0] y_out
);
    
    logic signed [15:0] taps [26:0];  // 27 taps
    logic signed [30:0] sum;
    logic signed [30:0] p[0:6];       // products used later, 7 non-zero unique coefficients
    
    // Q15 fixed-point coefficients (multiply by 32768 and round)
    // nonzero coefficients, symmetric
    const logic signed [15:0] w[0:6] = {
        16'sd4,      // h[0]  = +0.0001089559 * 32768 â‰ˆ 4
        -16'sd29,    // h[2]  = -0.0008923654 * 32768 â‰ˆ -29
        16'sd131,    // h[4]  = +0.0039866877 * 32768 â‰ˆ 131
        -16'sd421,   // h[6]  = -0.0128339805 * 32768 â‰ˆ -421
        16'sd1114,   // h[8]  = +0.0339994029 * 32768 â‰ˆ 1114
        -16'sd2785,  // h[10] = -0.0849921365 * 32768 â‰ˆ -2785
        16'sd10179   // h[12] = +0.3106238934 * 32768 â‰ˆ 10179
    };
    
    // center (13)
    const logic signed [15:0] w13 = 16'sd16384;  // h[13] = 0.5 * 32768 = 16384
    
    // shift register for filter taps
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            taps <= '{default: 16'b0};
        end else begin
            taps <= {taps[25:0], x_in};
        end
    end
    
    // compute symmetric pairs and multiply by coefficients
    always_comb begin
        // symmetry: h[i] = h[26-i], nonzero
        p[0] = w[0] * (taps[0]  + taps[26]);
        p[1] = w[1] * (taps[2]  + taps[24]);
        p[2] = w[2] * (taps[4]  + taps[22]);
        p[3] = w[3] * (taps[6]  + taps[20]);
        p[4] = w[4] * (taps[8]  + taps[18]);
        p[5] = w[5] * (taps[10] + taps[16]);
        p[6] = w[6] * (taps[12] + taps[14]);
        
        // sum all products plus center tap
        sum = p[0] + p[1] + p[2] + p[3] + p[4] + p[5] + p[6] + w13 * taps[13];
    end

    // output register with scaling (arithmetic right shift by 15 for Q15)
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) 
            y_out <= 16'sd0;
        else 
            y_out <= sum >>> 15;  // multiplying two Q15 numbers results in Q30, shift back to Q15
    end
    
endmodule