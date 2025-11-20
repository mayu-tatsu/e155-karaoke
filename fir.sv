// fir.sv
/// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-19

// 32-tap FIR compensation filter
// symmetry: 32 taps = 16 unique coefficients
module fir (
    input  logic               clk,
    input  logic               reset_n,
    input  logic signed [15:0] x_in,
    input  logic               x_in_valid,
    output logic signed [15:0] y_out,
    output logic               y_out_valid
);

    logic signed [15:0] taps[0:31];             // 32 tap delay line
    logic signed [16:0] sym_pairs[0:15];        // symmetric sums (17-bit)
    logic signed [32:0] products[0:15];         // products (33-bit)
    logic signed [37:0] accumulator;            // sum of 16 products (38-bit to be safe)

    logic [31:0] valid_reg;                     // track when delay line is full
    logic [3:0]  valid_pipeline;                // 4-stage pipeline: pair->mult->accum->output
    
    // Q15 coefficients - ALL 32 of them (not using symmetry optimization)
    const logic signed [15:0] coeff[0:31] = '{
        16'sd1,     16'sd24,    16'sd75,    16'sd91,
        -16'sd28,   -16'sd249,  -16'sd300,  16'sd91,
        16'sd700,   16'sd732,   -16'sd361,  -16'sd1817,
        -16'sd1666, 16'sd1525,  16'sd6769,  16'sd10843,

        16'sd10843, 16'sd6769,  16'sd1525,  -16'sd1666,
        -16'sd1817, -16'sd361,  16'sd732,   16'sd700,
        16'sd91,    -16'sd300,  -16'sd249,  -16'sd28,
        16'sd91,    16'sd75,    16'sd24,    16'sd1
    };
    
    // 1. Shift register
    int i;
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            taps <= '{default: 16'sd0};
            valid_reg <= 32'b0;
        end else if (x_in_valid) begin
            taps[0] <= x_in;
			taps[1] <= taps[1-1];
			taps[2] <= taps[2-1];
			taps[3] <= taps[3-1];
			taps[4] <= taps[4-1];
			taps[5] <= taps[5-1];
			taps[6] <= taps[6-1];
			taps[7] <= taps[7-1];
			taps[8] <= taps[8-1];
			taps[9] <= taps[9-1];
			taps[10] <= taps[10-1];
			taps[11] <= taps[11-1];
			taps[12] <= taps[12-1];
			taps[13] <= taps[13-1];
			taps[14] <= taps[14-1];
			taps[15] <= taps[15-1];
			taps[16] <= taps[16-1];
			taps[17] <= taps[17-1];
			taps[18] <= taps[18-1];
			taps[19] <= taps[19-1];
			taps[20] <= taps[20-1];
			taps[21] <= taps[21-1];
			taps[22] <= taps[22-1];
			taps[23] <= taps[23-1];
			taps[24] <= taps[24-1];
			taps[25] <= taps[25-1];
			taps[26] <= taps[26-1];
			taps[27] <= taps[27-1];
			taps[28] <= taps[28-1];
			taps[29] <= taps[29-1];
			taps[30] <= taps[30-1];
			taps[31] <= taps[31-1];
            valid_reg <= {valid_reg[30:0], 1'b1};
        end
    end
    
    // 2. compute symmetric pairs (exploiting symmetry to save multipliers)
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            sym_pairs <= '{default: 17'sd0};
            valid_pipeline[0] <= 1'b0;
        end else begin
			sym_pairs[0] <= $signed(taps[0]) + $signed(taps[31-0]);
			sym_pairs[1] <= $signed(taps[1]) + $signed(taps[31-1]);
			sym_pairs[2] <= $signed(taps[2]) + $signed(taps[31-2]);
			sym_pairs[3] <= $signed(taps[3]) + $signed(taps[31-3]);
			sym_pairs[4] <= $signed(taps[4]) + $signed(taps[31-4]);
			sym_pairs[5] <= $signed(taps[5]) + $signed(taps[31-5]);
			sym_pairs[6] <= $signed(taps[6]) + $signed(taps[31-6]);
			sym_pairs[7] <= $signed(taps[7]) + $signed(taps[31-7]);
			sym_pairs[8] <= $signed(taps[8]) + $signed(taps[31-8]);
			sym_pairs[9] <= $signed(taps[9]) + $signed(taps[31-9]);
			sym_pairs[10] <= $signed(taps[10]) + $signed(taps[31-10]);
			sym_pairs[11] <= $signed(taps[11]) + $signed(taps[31-11]);
			sym_pairs[12] <= $signed(taps[12]) + $signed(taps[31-12]);
			sym_pairs[13] <= $signed(taps[13]) + $signed(taps[31-13]);
			sym_pairs[14] <= $signed(taps[14]) + $signed(taps[31-14]);
			sym_pairs[15] <= $signed(taps[15]) + $signed(taps[31-15]);
            valid_pipeline[0] <= valid_reg[31];  // Start pipeline when delay line full
        end
    end

    logic [32:0] p1_shiftadd, p2_shiftadd, p3_shiftadd, p4_shiftadd, p5_shiftadd, 
                 p6_shiftadd, p7_shiftadd, p8_shiftadd, p9_shiftadd, p10_shiftadd, p11_shiftadd,
                 p12_shiftadd, p13_shiftadd, p14_shiftadd, p15_shiftadd;
    assign p0_shiftadd =    (sym_pairs[0]);			// 1x
	assign p1_shiftadd =   ((sym_pairs[1] <<< 4)	// 16x
                         +  (sym_pairs[1] <<< 3));	// 8x = 24x
    assign p2_shiftadd =   ((sym_pairs[2] <<< 6)	// 64x
						 +  (sym_pairs[2] <<< 3)    // 8x
                         +  (sym_pairs[2] <<< 1)    // 2x
                         +   sym_pairs[2]);         // 1x = 75x
    assign p3_shiftadd =   ((sym_pairs[3] <<< 6)	// 64x
						 +  (sym_pairs[3] <<< 4)    // 16x
                         +  (sym_pairs[3] <<< 3)    // 8x
                         +  (sym_pairs[3] <<< 1)    // 2x
                         +   sym_pairs[3]);         // 1x = 91x
    assign p4_shiftadd =   ((sym_pairs[4] <<< 4)    // 16x
                         +  (sym_pairs[4] <<< 3)    // 8x
                         +  (sym_pairs[4] <<< 2));  // 4x = -28x 
    assign p5_shiftadd = - ((sym_pairs[5] <<< 7)    // 128x
						 +  (sym_pairs[5] <<< 6)    // 64x
						 +  (sym_pairs[5] <<< 5)    // 32x
						 +  (sym_pairs[5] <<< 4)    // 16x
						 +  (sym_pairs[5] <<< 3)    // 8x
                         +   sym_pairs[5]);         // 1x = -249x
    assign p6_shiftadd = - ((sym_pairs[6] <<< 8)    // 256x
                         +  (sym_pairs[6] <<< 5)    // 32x
						 +  (sym_pairs[6] <<< 3)    // 8x
                         +   sym_pairs[6] <<< 2);   // 4x = -300x
    assign p7_shiftadd =   ((sym_pairs[7] <<< 6)	// 64x
						 +  (sym_pairs[7] <<< 4)    // 16x
                         +  (sym_pairs[7] <<< 3)    // 8x
                         +  (sym_pairs[7] <<< 1)    // 2x
                         +   sym_pairs[7]);         // 1x = 91x
    assign p8_shiftadd =   ((sym_pairs[8] <<< 9)    // 512x
                         +  (sym_pairs[8] <<< 7)    // 128x
						 +  (sym_pairs[8] <<< 5)    // 32x
						 +  (sym_pairs[8] <<< 4)    // 16x
						 +  (sym_pairs[8] <<< 3)    // 8x
                         +  (sym_pairs[8] <<< 2));  // 4x = 700x
    assign p9_shiftadd =   ((sym_pairs[9] <<< 9)    // 512x
                         +  (sym_pairs[9] <<< 7)    // 128x
						 +  (sym_pairs[9] <<< 6)    // 64x
						 +  (sym_pairs[9] <<< 4)    // 16x
						 +  (sym_pairs[9] <<< 3)    // 8x
                         +  (sym_pairs[9] <<< 2));  // 4x = 732x

    assign p10_shiftadd = - ((sym_pairs[10] <<< 8)      // 256x
                          +  (sym_pairs[10] <<< 6)      // 64x
                          +  (sym_pairs[10] <<< 5)      // 32x
                          +  (sym_pairs[10] <<< 3)      // 8x
                          +  (sym_pairs[10]));          // 1x = -361x
    assign p11_shiftadd = - ((sym_pairs[11] <<< 10)     // 1024x
                          +  (sym_pairs[11] <<< 9)      // 512x
                          +  (sym_pairs[11] <<< 8)      // 256x
                          +  (sym_pairs[11] <<< 4)      // 16x
                          +  (sym_pairs[11] <<< 3)      // 8x
                          +  (sym_pairs[11]));          // 1x = -1817x
    assign p12_shiftadd = - ((sym_pairs[12] <<< 10)     // 1024x
                          +  (sym_pairs[12] <<< 9)      // 512x
                          +  (sym_pairs[12] <<< 7)      // 128x
                          +  (sym_pairs[12] <<< 1));    // 2x = -1666x
    assign p13_shiftadd =   ((sym_pairs[13] <<< 10)     // 1024x
                          +  (sym_pairs[13] <<< 8)      // 256x
						  +  (sym_pairs[13] <<< 7)      // 128x
						  +  (sym_pairs[13] <<< 6)      // 64x
                          +  (sym_pairs[13] <<< 5)      // 32x
                          +  (sym_pairs[13] <<< 4)    	// 16x
						  +  (sym_pairs[13] <<< 2)      // 4x
						  +  (sym_pairs[13]));	      	// 1x = 1525x
    assign p14_shiftadd =   ((sym_pairs[14] <<< 12)     // 4096x
						  +  (sym_pairs[14] <<< 11)     // 2048x
                          +  (sym_pairs[14] <<< 9)      // 512x
                          +  (sym_pairs[14] <<< 6)      // 64x
                          +  (sym_pairs[14] <<< 5)      // 32x 
                          +  (sym_pairs[14] <<< 4)      // 16x
                          +  (sym_pairs[14]));    		// 1x = 6769x
    assign p15_shiftadd =   ((sym_pairs[15] <<< 13)     // 8192x
                          +  (sym_pairs[15] <<< 11)     // 2048x
                          +  (sym_pairs[15] <<< 9)      // 512x
                          +  (sym_pairs[15] <<< 6)      // 64x
                          +  (sym_pairs[15] <<< 4)      // 16x
						  +  (sym_pairs[15] <<< 3)      // 8x
                          +  (sym_pairs[15] <<< 1)      // 2x
						  +  (sym_pairs[15]));			// 1x = 10843x


    // 3. mult by coefficients
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            products <= '{default: 33'sd0};
            valid_pipeline[1] <= 1'b0;
        end else begin
			products[0] <= 0;
			products[1] <= p1_shiftadd;
			products[2] <= p2_shiftadd;
			products[3] <= p3_shiftadd;
			products[4] <= p4_shiftadd;
			products[5] <= p5_shiftadd;
			products[6] <= p6_shiftadd;
			products[7] <= p7_shiftadd;
			products[8] <= p8_shiftadd;
			products[9] <= p9_shiftadd;
			products[10] <= p10_shiftadd;
			products[11] <= p11_shiftadd;
			products[12] <= p12_shiftadd;
			products[13] <= p13_shiftadd;
			products[14] <= p14_shiftadd;
			products[15] <= p15_shiftadd;
            
            valid_pipeline[1] <= valid_pipeline[0];
        end
    end

    // 4. accumulate all products
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            accumulator <= 38'sd0;
            valid_pipeline[2] <= 1'b0;
        end else begin
            accumulator <= $signed(products[0])  + $signed(products[1])  + $signed(products[2])  + $signed(products[3])
                         + $signed(products[4])  + $signed(products[5])  + $signed(products[6])  + $signed(products[7])
                         + $signed(products[8])  + $signed(products[9])  + $signed(products[10]) + $signed(products[11])
                         + $signed(products[12]) + $signed(products[13]) + $signed(products[14]) + $signed(products[15]);
            valid_pipeline[2] <= valid_pipeline[1];
        end
    end
    
    // 5. scale (Q30 -> Q15) and output
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            y_out <= 16'sd0;
            y_out_valid <= 1'b0;
            valid_pipeline[3] <= 1'b0;
        end else begin
            // right shift by 15: Q30 -> Q15
			// y_out <= $signed(accumulator) >>> 15;

			// note: we may need to clamp in case values go outside of 16 bit range
            // convert Q30 -> Q15
            // only need 15-BIT shift on full signed accumulator 
            logic signed [22:0] result_q15;
            result_q15 = $signed(accumulator) >>> 15;

            // limiting max/min since we're limiting to 16-bit
            if (result_q15 > 23'sd16383) begin
                y_out <= 16'sd32767;
            end else if (result_q15 < -23'sd16384) begin
                y_out <= -16'sd32768;
            end else begin
                y_out <= result_q15[15:0];
            end   

            y_out_valid <= valid_pipeline[2] & ~valid_pipeline[3];  // pulse only on rising edge
            valid_pipeline[3] <= valid_pipeline[2];                  // store previous state
        end
    end
endmodule
