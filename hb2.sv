// hb2.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-16

// Halfband decimation filter

module hb2(
    input  logic clk,
    input  logic reset_n,
    input  logic signed [15:0] x_in,
    input  logic               x_in_valid,
    output logic signed [15:0] y_out,
    output logic               y_out_valid
);
    
    logic signed [15:0] taps [26:0];    // 27 taps

    logic [26:0] valid_reg;             // valid signal shift register
    logic        sample_counter;        // track decimation by 2

    // Q15 fixed-point coefficients (multiply by 32768 and round)
    // nonzero coefficients, symmetric
    const logic signed [15:0] w[0:6] = {
        16'sd2,       // h[0]  = +0.0000605391 * 32768 = 2
        -16'sd20,     // h[2]  = -0.0005984017 * 32768 = -20
        16'sd101,     // h[4]  = +0.0030800715 * 32768 = 101
        -16'sd361,    // h[6]  = -0.0110232360 * 32768 = -361
        16'sd1032,    // h[8]  = +0.0315044936 * 32768 = 1032
        -16'sd2710,   // h[10] = -0.0827177219 * 32768 = -2710
        16'sd10148    // h[12] = +0.3096942933 * 32768 = 10148
    };

    // Center tap
    const logic signed [15:0] w13 = 16'sd16384; // h[13] = 0.5 * 32768
    

    logic signed [16:0] sym_pairs [0:6];    // symmetric sums (17-bit to handle overflow)
    logic signed [15:0] center_tap;         // center tap value
    logic               stage1_valid;
    logic               stage1_decim;       // track which samples to decimate
    
    logic signed [33:0] products [0:6];     // products (17-bit * 16-bit = 33-bit)
    logic signed [31:0] center_product;     // center tap product
    logic               stage2_valid;
    
    logic signed [37:0] accumulator;        // sum of all products (38-bit for safety)
    logic               stage3_valid;

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            taps[0] <= 16'sd0;
            taps[1] <= 16'sd0;
            taps[2] <= 16'sd0;
            taps[3] <= 16'sd0;
            taps[4] <= 16'sd0;
            taps[5] <= 16'sd0;
            taps[6] <= 16'sd0;
            taps[7] <= 16'sd0;
            taps[8] <= 16'sd0;
            taps[9] <= 16'sd0;
            taps[10] <= 16'sd0;
            taps[11] <= 16'sd0;
            taps[12] <= 16'sd0;
            taps[13] <= 16'sd0;
            taps[14] <= 16'sd0;
            taps[15] <= 16'sd0;
            taps[16] <= 16'sd0;
            taps[17] <= 16'sd0;
            taps[18] <= 16'sd0;
            taps[19] <= 16'sd0;
            taps[20] <= 16'sd0;
            taps[21] <= 16'sd0;
            taps[22] <= 16'sd0;
            taps[23] <= 16'sd0;
            taps[24] <= 16'sd0;
            taps[25] <= 16'sd0;
            taps[26] <= 16'sd0;	
            valid_reg <= '0;
            sample_counter <= 1'b0;
        end else if (x_in_valid) begin
            taps <= {taps[25:0], x_in};
            valid_reg <= {valid_reg[25:0], 1'b1};   // always shift 1 when valid input arrives
            sample_counter <= ~sample_counter;      // toggle for decimation
        end
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            sym_pairs <= '{default: 17'sd0};
            center_tap <= 16'sd0;
            stage1_valid <= 1'b0;
            stage1_decim <= 1'b0;
        end else begin			// computing pairs
            sym_pairs[0] <= $signed(taps[0])  + $signed(taps[26]);
            sym_pairs[1] <= $signed(taps[2])  + $signed(taps[24]);
            sym_pairs[2] <= $signed(taps[4])  + $signed(taps[22]);
            sym_pairs[3] <= $signed(taps[6])  + $signed(taps[20]);
            sym_pairs[4] <= $signed(taps[8])  + $signed(taps[18]);
            sym_pairs[5] <= $signed(taps[10]) + $signed(taps[16]);
            sym_pairs[6] <= $signed(taps[12]) + $signed(taps[14]);
            center_tap <= taps[13];
            
            // pipeline valid signal (only when decimating and delay line is full)
            stage1_valid <= x_in_valid && sample_counter && valid_reg[26];
            stage1_decim <= sample_counter;
        end
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            products <= '{default: 34'sd0};
            center_product <= 32'sd0;
            stage2_valid <= 1'b0;
        end else begin
            // mult each pair by its coefficient
			products[0] <= $signed(sym_pairs[0]) * $signed(w[0]);
			products[1] <= $signed(sym_pairs[1]) * $signed(w[1]);
			products[2] <= $signed(sym_pairs[2]) * $signed(w[2]);
			products[3] <= $signed(sym_pairs[3]) * $signed(w[3]);
			products[4] <= $signed(sym_pairs[4]) * $signed(w[4]);
			products[5] <= $signed(sym_pairs[5]) * $signed(w[5]);
			products[6] <= $signed(sym_pairs[6]) * $signed(w[6]);
            center_product <= $signed(center_tap) * $signed(w13);
            
            stage2_valid <= stage1_valid;
        end
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            accumulator <= 38'sd0;
            stage3_valid <= 1'b0;
        end else begin
            // sum all products
            accumulator <= $signed(products[0]) + $signed(products[1]) + $signed(products[2]) 
                         + $signed(products[3]) + $signed(products[4]) + $signed(products[5]) 
                         + $signed(products[6]) + $signed(center_product);
            
            stage3_valid <= stage2_valid;
        end
    end

    // output register with scaling (arithmetic right shift by 15 for Q15)
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            y_out <= 16'sd0;
            y_out_valid <= 1'b0;
        end else if (stage3_valid) begin
            y_out <= accumulator >>> 15;  // multiplying two Q15 numbers results in Q30, shift back to Q15
            y_out_valid <= 1'b1;
        end else begin
            y_out_valid <= 1'b0;
        end
    end
    
endmodule