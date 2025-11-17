// fir.sv
/// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16

// 32-tap FIR compensation filter
// symmetry: 32 taps = 16 unique coefficients

module fir (
    input  logic               clk,
    input  logic               reset_n,
    input  logic signed [15:0] noisy_signal,
    output logic signed [15:0] filtered_signal
);

    logic signed [15:0] taps      [31:0];       // 32 tap delay line
    logic signed [16:0] sym_pairs [0:15];       // symmetric sums (needs +1 bit for addition)
    logic signed [32:0] products  [0:15];       // products (16-bit × 17-bit = 33-bit)
    logic signed [36:0] accumulator;            // final sum
    
    // Q15 fixed-point coefficients, but might be worth looking into Q31 (if resources are available)
    // only 16 unique coefficients (h[0] to h[15]), symmetry: h[i] = h[31-i]
    const logic signed [15:0] coeff[0:15] = {
        16'sd1,         // h[0]  = +0.00001081 * 32768 ≈ 1
        16'sd-3,        // h[1]  = -0.00008800 * 32768 ≈ -3
        16'sd12,        // h[2]  = +0.00035052 * 32768 ≈ 12 (11.48, need to round)
        16'sd-28,       // h[3]  = -0.00085326 * 32768 ≈ -28
        16'sd40,        // h[4]  = +0.00122816 * 32768 ≈ 40
        16'sd-13,       // h[5]  = -0.00038430 * 32768 ≈ -13
        16'sd-98,       // h[6]  = -0.00297503 * 32768 ≈ -98 (-97.54, need to round)
        16'sd279,       // h[7]  = +0.00852009 * 32768 ≈ 279
        16'sd-399,      // h[8]  = -0.01217676 * 32768 ≈ -399
        16'sd213,       // h[9]  = +0.00650601 * 32768 ≈ 213
        16'sd462,       // h[10] = +0.01410197 * 32768 ≈ 462
        16'sd-1474,     // h[11] = -0.04498777 * 32768 ≈ -1474
        16'sd2148,      // h[12] = +0.06555845 * 32768 ≈ 2148
        16'sd-1348,     // h[13] = -0.04114019 * 32768 ≈ -1348
        16'sd-2619,     // h[14] = -0.07992416 * 32768 ≈ -2619
        16'sd19210,     // h[15] = +0.58625349 * 32768 ≈ 19210
    };
    
    integer i;
    
    // shift register for tap delay line
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            taps <= '{default: 16'sd0};
        end else begin
            taps[0] <= noisy_signal;
            for (i = 1; i < 32; i = i + 1) begin
                taps[i] <= taps[i-1];
            end
        end
    end
    
    // Compute symmetric pairs, products, and accumulate
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            sym_pairs <= '{default: 17'sd0};
            products <= '{default: 33'sd0};
            accumulator <= 37'sd0;
        end else begin
            // 1. add symmetric pairs
            // h[i] = h[31-i], so add taps[i] + taps[31-i]
            for (i = 0; i < 16; i = i + 1) begin
                sym_pairs[i] <= taps[i] + taps[31-i];
            end
            
            // 2. mult coefficients
            for (i = 0; i < 16; i = i + 1) begin
                products[i] <= sym_pairs[i] * coeff[i];
            end
            
            // 3. sum all products
            accumulator <= products[0]  + products[1]  + products[2]  + products[3]  +
                          products[4]  + products[5]  + products[6]  + products[7]  +
                          products[8]  + products[9]  + products[10] + products[11] +
                          products[12] + products[13] + products[14] + products[15];
        end
    end
    
    // output stage: scale from Q15×Q15=Q30 back to Q15
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            filtered_signal <= 16'sd0;
        end else begin
            // arithmetic right shift by 15 to convert Q30 → Q15
            filtered_signal <= accumulator >>> 15;
        end
    end
endmodule

    // 32-tap coefficients for my FIR filter
    /*const logic signed [31:0] w[0:31] = {
        16'sd1,         // h[0]  = +0.00001081 * 32768 ≈ 1
        16'sd-3,        // h[1]  = -0.00008800 * 32768 ≈ -3
        16'sd12,        // h[2]  = +0.00035052 * 32768 ≈ 12 (11.48, need to round)
        16'sd-28,       // h[3]  = -0.00085326 * 32768 ≈ -28
        16'sd40,        // h[4]  = +0.00122816 * 32768 ≈ 40
        16'sd-13,       // h[5]  = -0.00038430 * 32768 ≈ -13
        16'sd-98,       // h[6]  = -0.00297503 * 32768 ≈ -98 (-97.54, need to round)
        16'sd279,       // h[7]  = +0.00852009 * 32768 ≈ 279
        16'sd-399,      // h[8]  = -0.01217676 * 32768 ≈ -399
        16'sd213,       // h[9]  = +0.00650601 * 32768 ≈ 213
        16'sd462,       // h[10] = +0.01410197 * 32768 ≈ 462
        16'sd-1474,     // h[11] = -0.04498777 * 32768 ≈ -1474
        16'sd2148,      // h[12] = +0.06555845 * 32768 ≈ 2148
        16'sd-1348,     // h[13] = -0.04114019 * 32768 ≈ -1348
        16'sd-2619,     // h[14] = -0.07992416 * 32768 ≈ -2619
        16'sd19210,     // h[15] = +0.58625349 * 32768 ≈ 19210
        16'sd19210,     // h[16] = +0.58625349 * 32768 ≈ 19210
        16'sd-2619,     // h[17] = -0.07992416 * 32768 ≈ -2619
        16'sd-1348,     // h[18] = -0.04114019 * 32768 ≈ -1348
        16'sd2148,      // h[19] = +0.06555845 * 32768 ≈ 2148
        16'sd-1474,     // h[20] = -0.04498777 * 32768 ≈ -1474
        16'sd462,       // h[21] = +0.01410197 * 32768 ≈ 462
        16'sd213,       // h[22] = +0.00650601 * 32768 ≈ 213
        16'sd-399,      // h[23] = -0.01217676 * 32768 ≈ -399
        16'sd279,       // h[24] = +0.00852009 * 32768 ≈ 279
        16'sd-98,       // h[25] = -0.00297503 * 32768 ≈ -98
        16'sd-13,       // h[26] = -0.00038430 * 32768 ≈ -13
        16'sd40,        // h[27] = +0.00122816 * 32768 ≈ 40
        16'sd-28,       // h[28] = -0.00085326 * 32768 ≈ -28
        16'sd12,        // h[29] = +0.00035052 * 32768 ≈ 12
        16'sd-3,        // h[30] = -0.00008800 * 32768 ≈ -3
        16'sd1,         // h[31] = +0.00001081 * 32768 ≈ 1
    };*/