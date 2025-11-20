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
        16'sd0,     -16'sd3,    16'sd11,    -16'sd27,
        16'sd39,    -16'sd11,   -16'sd98,   16'sd277,
        -16'sd392,  16'sd203,   16'sd471,   -16'sd1475,
        16'sd2137,  -16'sd1328, -16'sd2638, 16'sd19218,
        16'sd19218, -16'sd2638, -16'sd1328, 16'sd2137,
        -16'sd1475, 16'sd471,   16'sd203,   -16'sd392,
        16'sd277,   -16'sd98,   -16'sd11,   16'sd39,
        -16'sd27,   16'sd11,    -16'sd3,    16'sd0
    };
    
    // 1. Shift register
    int i;
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            taps <= '{default: 16'sd0};
            valid_reg <= 32'b0;
        end else if (x_in_valid) begin
            taps[0] <= x_in;
            for (i = 1; i < 32; i = i + 1) begin
                taps[i] <= taps[i-1];
            end
            valid_reg <= {valid_reg[30:0], 1'b1};
        end
    end
    
    // 2. compute symmetric pairs (exploiting symmetry to save multipliers)
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            sym_pairs <= '{default: 17'sd0};
            valid_pipeline[0] <= 1'b0;
        end else begin
            for (i = 0; i < 16; i = i + 1) begin
                sym_pairs[i] <= $signed(taps[i]) + $signed(taps[31-i]);
            end
            valid_pipeline[0] <= valid_reg[31];  // Start pipeline when delay line full
        end
    end
    
    // 3. mult by coefficients
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            products <= '{default: 33'sd0};
            valid_pipeline[1] <= 1'b0;
        end else begin
            for (i = 0; i < 16; i = i + 1) begin
                products[i] <= $signed(sym_pairs[i]) * $signed(coeff[i]);
            end
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
    
    // 5. Scale (Q30 -> Q15) and output
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            y_out <= 16'sd0;
            y_out_valid <= 1'b0;
            valid_pipeline[3] <= 1'b0;
        end else begin
            // right shift by 15: Q30 -> Q15
            y_out <= accumulator[37:15] >>> 15;  // just take upper bits and shift
            y_out_valid <= valid_pipeline[2];
            valid_pipeline[3] <= valid_pipeline[2];
        end
    end
endmodule