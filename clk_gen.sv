// clk_gen.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// 2025-09-22

// Generates a 48 MHz clock using the iCE40UP's onboard
// high-speed oscillator, then divides it to 2.304 MHz.
// The module, HSCOSC, takes in a CLKHF_DIV to specify
// frequency and outputs the new clk from the port CLKHF.

module clk_gen(
	input  logic reset,
	output logic clk_2_304mhz
);
	logic clk_48mhz;
	HSOSC #(.CLKHF_DIV("0b00")) hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk_48mhz));

	// 2.304 MHz clock divider
	// 48,000,000 / 2,304,000 = 480,000 / 2,304 = 20.833
	// 2400000

    // might be worth to look into the PLL in the future for cleaner clock

	logic [31:0] counter_2_304mhz;
	logic        clk_divided_2_304mhz;

	always_ff @(posedge clk_48mhz) begin
		if (~reset) begin
			counter_2_304mhz     <= 32'b0;
			clk_divided_2_304mhz <= 1'b0;
		end else if (counter_2_304mhz < 32'd21) begin 
			counter_2_304mhz <= counter_2_304mhz + 1;
		end else begin
			counter_2_304mhz     <= 32'b0;
			clk_divided_2_304mhz <= ~clk_divided_2_304mhz;
		end
	end
	assign clk_2_304mhz = clk_divided_2_304mhz;
endmodule