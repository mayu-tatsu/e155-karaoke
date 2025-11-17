// hb2.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16

module hb2(
    input  logic clk,
    input  logic reset_n,
    input  logic signed [15:0] x_in,    
    output logic signed [15:0] y_out
);
    
    logic signed [15:0] taps [34:0];  // 35 taps
    logic signed [30:0] sum;
    logic signed [30:0] p[0:8];       // 9 non-zero unique coefficients
    
    // Q15 fixed-point coefficients (multiply by 32768 and round)
    // nonzero coefficients, symmetric
    const logic signed [15:0] w[0:8] = {
        16'sd1471,   // h[0]  = +0.0448884044 * 32768 â‰ˆ 1471
        -16'sd548,   // h[2]  = -0.0167313026 * 32768 â‰ˆ -548
        16'sd670,    // h[4]  = +0.0204620246 * 32768 â‰ˆ 670
        -16'sd834,   // h[6]  = -0.0254535821 * 32768 â‰ˆ -834
        16'sd1062,   // h[8]  = +0.0324177338 * 32768 â‰ˆ 1062
        -16'sd1416,  // h[10] = -0.0432117850 * 32768 â‰ˆ -1416
        16'sd2030,   // h[12] = +0.0619786032 * 32768 â‰ˆ 2030
        -16'sd3443,  // h[14] = -0.1050519489 * 32768 â‰ˆ -3443
        16'sd10418   // h[16] = +0.3179725661 * 32768 â‰ˆ 10418
    };
    
    // center (17)
    const logic signed [15:0] w17 = 16'sd16384;  // h[17] = 0.5 * 32768 = 16384
    
    // shift register for filter taps
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            taps <= '{default: 16'b0};
        end else begin
            taps <= {taps[33:0], x_in};
        end
    end
    
    // compute symmetric pairs and multiply by coefficients
    always_comb begin
        // symmetry: h[i] = h[34-i], nonzero
        p[0] = w[0] * (taps[0]  + taps[34]);
        p[1] = w[1] * (taps[2]  + taps[32]);
        p[2] = w[2] * (taps[4]  + taps[30]);
        p[3] = w[3] * (taps[6]  + taps[28]);
        p[4] = w[4] * (taps[8]  + taps[26]);
        p[5] = w[5] * (taps[10] + taps[24]);
        p[6] = w[6] * (taps[12] + taps[22]);
        p[7] = w[7] * (taps[14] + taps[20]);
        p[8] = w[8] * (taps[16] + taps[18]);
        
        // sum all products plus center tap
        sum = p[0] + p[1] + p[2] + p[3] + p[4] + p[5] + p[6] + p[7] + p[8] + w17 * taps[17];
    end

    // output register with scaling (arithmetic right shift by 15 for Q15)
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) 
            y_out <= 16'sd0;
        else 
            y_out <= sum >>> 15;  // Q30 -> Q15
    end
    
endmodule