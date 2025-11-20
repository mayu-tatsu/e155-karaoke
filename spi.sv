// spi.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-19

// clock domain crossing D:

module spi (
    input  logic        clk,
    input  logic        reset_n,
    input  logic [15:0] pcm_out,
    input  logic        audio_valid,   // 1-cycle pulse

    input  logic        sck,           // SPI clock from MCU
    output logic        sdo            // serial data to MCU
);
	// no sdi, cs. we aren't taking any data from the MCU and
	// we assume MCU is always listening


    // new audio_valid pulse, put into pcm_reg and flip sample_toggle
    logic [15:0] pcm_reg;
    logic        sample_toggle;

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            pcm_reg       <= 16'd0;
            sample_toggle <= 1'b0;
        end else begin
            if (audio_valid) begin
                pcm_reg       <= pcm_out;           // catch new sample, keep until next audio_valid
                sample_toggle <= ~sample_toggle;    // notify sck domain
            end
        end
    end


	// detect sample_toggle edge in the sck domain!!
    // sync toggle flag into sck domain using 2-stage synchronizer
    logic sample_toggle_synced;
    synchronizer toggle_sync (
        .clk(sck),
        .reset_n(reset_n),
        .async_in(sample_toggle),
        .sync_out(sample_toggle_synced)
    );
	
	
    // edge detection on synchronized toggle in sck domain!!!
	// compares current vs prev. values of sample_toggle_synced
	// if diff, new sample is ready & new_sample_detected pulses
    logic sample_toggle_prev, new_sample_detected;
    
    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            sample_toggle_prev   <= 1'b0;
            new_sample_detected  <= 1'b0;
        end else begin
            sample_toggle_prev  <= sample_toggle_synced;
            new_sample_detected <= (sample_toggle_synced ^ sample_toggle_prev);
        end
    end


	// if new_sample_detected, load pcm_reg into shift_reg and reset counter
	// at every sck rising edge, left shift & increment counter (MSB to LSB)
	// after 16 edges/shifts, stop and wait until new new_sample_detected
    logic [15:0] shift_reg;
	logic [4:0]  bit_count;     // counts 0 to 15
    logic        sdo_reg;

    always_ff @(posedge sck or negedge reset_n) begin
        if (~reset_n) begin
            shift_reg <= 16'd0;
            bit_count <= 5'd16;  // idle 
        end else begin
            if (new_sample_detected) begin
                // load new sample from clk domain
                shift_reg <= pcm_reg;
                bit_count <= 5'd0;
            end else if (bit_count < 16) begin
                // shift left after each transmitted bit
                shift_reg <= {shift_reg[14:0], 1'b0};
                bit_count <= bit_count + 5'd1;
            end
        end
    end

	
	// rising edge: shift register updates (shift_reg[15])
    // falling edge: sdo is updated with stable shift_reg[15]
    always_ff @(negedge sck or negedge reset_n) begin
        if (~reset_n) begin
            sdo_reg <= 1'b0;
        end else begin
            if (bit_count < 16)
                sdo_reg <= shift_reg[15];
            else
                sdo_reg <= 1'b0; // idle
        end
    end

    assign sdo = sdo_reg;
endmodule