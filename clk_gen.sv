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
	// 48,000,000 / 1,536,000 = 48,000 / 1,536 = 31.25

    // fractional divider to get 31.25
    // (31+31+31+32)/4 = 125/4 = 31.25 avg
    
    logic [5:0] counter;			// 6 bits to count to 32
    logic [1:0] cycle_counter; 		// track cycle out of 4
    logic [5:0] divisor;			// current divisor, depends on cycle
	logic [5:0] divisor_min_one;
	assign divisor_min_one = divisor - 1;
    // Determine divisor based on cycle: 31, 31, 31, 32
    always_comb begin
        if (cycle_counter == 2'b11)
            divisor = 6'd32;
        else
            divisor = 6'd31;
    end

    always_ff @(posedge clk_48mhz) begin
        if (~reset_n) begin
            counter <= 0;
            cycle_counter <= 0;
            clk_out <= 1'b0;
        end else begin
            if (counter == divisor_min_one) begin
                counter <= 0;
                clk_out <= ~clk_out;
                
                // Move to next cycle when we toggle clk_out to 0
                if (clk_out == 1'b1) begin
                    cycle_counter <= cycle_counter + 1;
                end
            end else begin
                counter <= counter + 1;
            end
        end
    end
	
	// 6 MHz clock divider
	// 48,000,000 / 6,000,000 = 8
	
	logic [3:0] counter_6mhz;
	logic       clk_divided_6mhz;

	always_ff @(posedge clk_48mhz) begin
		if (~reset_n) begin
			counter_6mhz <= 32'b0;
			clk_divided_6mhz <= 1'b0;
		end
		else if (counter_6mhz < 4'd8) counter_6mhz <= counter_6mhz + 1;
		else begin
			counter_6mhz     <= 32'b0;
			clk_divided_6mhz <= ~clk_divided_6mhz;
		end
	end
	
	assign clk_6mhz = clk_divided_6mhz;
	
endmodule
