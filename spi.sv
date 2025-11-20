// spi.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-19

module spi (
    input  logic        clk,
    input  logic        reset_n,
    input  logic [15:0] pcm_out,
    input  logic        audio_valid,   // 1-cycle pulse
    input  logic        sck,           // SPI clock from MCU
    output logic        sdo            // serial data to MCU
);
    
    // CLK DOMAIN: Capture new audio sample and toggle flag
    logic [15:0] pcm_reg;
    logic        sample_toggle;
    
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            pcm_reg       <= 16'd0;
            sample_toggle <= 1'b0;
        end else begin
            if (audio_valid) begin
                pcm_reg       <= pcm_out;
                sample_toggle <= ~sample_toggle;
            end
        end
    end
    
    // SCK DOMAIN: Synchronize toggle flag
    logic sample_toggle_sync1, sample_toggle_sync2;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            sample_toggle_sync1 <= 1'b0;
            sample_toggle_sync2 <= 1'b0;
        end else begin
            sample_toggle_sync1 <= sample_toggle;
            sample_toggle_sync2 <= sample_toggle_sync1;
        end
    end
    
    // SCK DOMAIN: Synchronize data register (multi-bit CDC)
    logic [15:0] pcm_sync1, pcm_sync2;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            pcm_sync1 <= 16'd0;
            pcm_sync2 <= 16'd0;
        end else begin
            pcm_sync1 <= pcm_reg;
            pcm_sync2 <= pcm_sync1;
        end
    end
    
    // SCK DOMAIN: Edge detection on synchronized toggle
    logic sample_toggle_prev, new_sample;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            sample_toggle_prev <= 1'b0;
            new_sample         <= 1'b0;
        end else begin
            sample_toggle_prev <= sample_toggle_sync2;
            new_sample         <= (sample_toggle_sync2 != sample_toggle_prev);
        end
    end
    
    // SCK DOMAIN: Shift register and bit counter
    logic [15:0] shift_reg;
    logic [4:0]  bit_count;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            shift_reg <= 16'd0;
            bit_count <= 5'd16;  // idle state
        end else begin
            if (new_sample) begin
                shift_reg <= pcm_sync2;  // Load synchronized data
                bit_count <= 5'd0;
            end else if (bit_count < 16) begin
                shift_reg <= {shift_reg[14:0], 1'b0};  // Shift left
                bit_count <= bit_count + 5'd1;
            end
        end
    end
    
    // SCK DOMAIN: Output data on falling edge for stability
    logic sdo_reg;
    
    always_ff @(negedge sck or negedge reset_n) begin
        if (~reset_n) begin
            sdo_reg <= 1'b0;
        end else begin
            if (bit_count < 16)
                sdo_reg <= shift_reg[15];
            else
                sdo_reg <= 1'b0;  // idle
        end
    end
    
    assign sdo = sdo_reg;
    
endmodule