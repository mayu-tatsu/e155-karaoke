// clk_gen.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// 2025-09-22

// Generates a 48 MHz clock using the iCE40UP's onboard
// high-speed oscillator, then divides it to 1.536 MHz.
// The module, HSCOSC, takes in a CLKHF_DIV to specify
// frequency and outputs the new clk from the port CLKHF.

module clk_gen(
	input  logic reset_n,
	output logic clk_out,
    output logic clk_6mhz
);

    logic clk_48mhz;
    HSOSC #(.CLKHF_DIV("0b00")) hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk_48mhz));

	// 1.536 MHz clock divider
	// 48,000,000 / 1,536,000 = 48,000 / 1,536 = 31.25 -> div by 2 for toggle -> 15.625

    // fractional divider to get 15.625
    // (15+16+15+16+15+16+16+16)/8 = 125/8 = 15.625 avg
    
    logic [4:0] counter;            // Count up to 16
    logic [2:0] cycle_counter;      // Track cycle out of 8 (0..7)
    logic [4:0] divisor;            // Current toggle target
    
    // 15, 16, 15, 16, 15, 16, 16, 16
    always_comb begin
        case (cycle_counter)
            3'd0, 3'd2, 3'd4: divisor = 5'd15;
            default:          divisor = 5'd16;
        endcase
    end
    
    // We compare against divisor-1 because counter starts at 0
    logic [4:0] divisor_min_one;
    assign divisor_min_one = divisor - 1'b1;

    always_ff @(posedge clk_48mhz) begin
        if (~reset_n) begin
            counter <= 0;
            cycle_counter <= 0;
            clk_out <= 1'b0;
        end else begin
            if (counter >= divisor_min_one) begin
                counter <= 0;
                clk_out <= ~clk_out; // Toggle clock
                cycle_counter <= cycle_counter + 1; // Move to next step in pattern
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // 6 MHz clock divider
    // 48,000,000 / 6,000,000 = 48 / 6 = 8 (div by 2 for toggle -> 4 = 3'b011)
    logic [2:0] counter_6mhz;
    logic       clk_divided_6mhz;

    always_ff @(posedge clk_48mhz) begin
		if (~reset_n) begin
			counter_6mhz     <= 3'b0;
			clk_divided_6mhz <= 1'b0;
		end
		else if (counter_6mhz < 3'd011) counter_6mhz <= counter_6mhz + 1;
		else begin
			counter_6mhz     <= 3'b0;
			clk_divided_6mhz <= ~clk_divided_6mhz;
		end
	end

	assign clk_6mhz = clk_divided_6mhz;
endmodule
