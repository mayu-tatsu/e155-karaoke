// synchronizer.sv
// 2-stage synchronizer for clock domain crossing
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-18

module synchronizer(
    input  logic clk,
    input  logic reset_n,
    input  logic async_in,
    output logic sync_out
);
    logic sync_stage1;
    
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            sync_stage1 <= '0;
            sync_out    <= '0;
        end else begin
            sync_stage1 <= async_in;
            sync_out    <= sync_stage1;
        end
    end
endmodule