// spi.sv
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-30

// Toggle-handshake CDC, 16-bit PCM -> MCU via SPI (no CS, no SDI)

module spi (
    input  logic        clk,           // 1.536 MHz (audio domain)
    input  logic        clk_6mhz,      // 6 MHz (SPI clock source)
    input  logic        reset_n,
    
    input  logic        audio_valid,   // clk domain
    input  logic [15:0] pcm_out,       // clk domain

    output logic        sck,           // to MCU (SPI SCK)
    output logic        sdo,            // to MCU (MOSI)
	
	
	output logic debug1,			// for debugging
	output logic debug2
);

	// note to self: debugging with busy and sck_enable made the sck/sdo output hella... idk why

    /*

    1. clk (1.536 MHz) domain
        * latch pcm_out into local buffer
        * toggle req_toggle to signal new data ready

    2. cross clock domains (clk -> clk_6mhz)
        * synchronize req_toggle -> req_sync1
        * assume pcm_latched is stable when req_toggle crosses (std. handshake scheme)
    
    3. clk_6mhz (6 MHz) domain
        * detect changes in req_sync1 (new request)
        * SPI transmitter 2-state FSM (based on 'busy' signal)
            - idle when not busy
            - on new request: load pcm_latched into shift register & set busy
            - when busy: shift out 16 bits MSB first on sdo & generate sck (3 MHz)

    */

    // 1. CLK DOMAIN LOGIC
    // store sample and toggle request

    logic audio_valid_d;            // used for edge detection
    logic req_toggle;               // toggled when new sample is ready, signals to SPI domain
    logic [15:0] pcm_latched;       // local buffer
	
    logic audio_valid_rise;         // REGISTERED edge detection signal

    // Edge detection for audio_valid (REGISTERED VERSION)
    // This avoids X propagation issues in simulation
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            audio_valid_d    <= 1'b0;
            audio_valid_rise <= 1'b0;
        end else begin
            audio_valid_d    <= audio_valid;
            audio_valid_rise <= audio_valid & ~audio_valid_d;  // Register the edge detect
        end
    end

	/*

    // detects rising edge (audio_valid=1, audio_valid_d=0) in clk domain
    // audio_valid_d stores the previous clock value
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            audio_valid_d <= 1'b0;
        end else begin
            audio_valid_d <= audio_valid;
        end
    end
    // high for only one clk cycle when rising edge AKA new sample is available
    logic audio_valid_rise = audio_valid & ~audio_valid_d; */


	logic [15:0] fake_data;
	assign fake_data = 16'b1100110011001100;

    // main handshake:
    // on rising edge of audio_valid:
    //      store PCM sample in pcm_latched (temporarily!)
    //      toggle req_toggle to signal to SPI domain that new data is ready
    
    // later: SPI domain will detect the toggle and transmit the latched data
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            req_toggle  <= 1'b0;
            pcm_latched <= 16'h0000;
        end else begin
            if (audio_valid_rise) begin
                pcm_latched <= fake_data;
                req_toggle  <= ~req_toggle;
            end
        end
    end


    // 2. CLOCK DOMAIN CROSSING / SYNCHRONIZERS
    // clk -> clk_6mhz
    
    // req_toggle -> req_sync1 (std. 2-flop synchronizer)
    logic req_sync0, req_sync1;
    always_ff @(posedge clk_6mhz or negedge reset_n) begin
        if (~reset_n) begin
            req_sync0 <= 1'b0;
            req_sync1 <= 1'b0;
        end else begin
            req_sync0 <= req_toggle;
            req_sync1 <= req_sync0;
        end
    end


    // 3. SPI TRANSMITTER LOGIC, ALL 6 MHZ DOMAIN
    // single-bit fsm (busy or not) to shift out 16 bits (msb first) thru sdo & generate sck
    // SPI mode 0: cpol=0, cpha=0 AKA idle low, data latched on rising edge of sck
    
    logic req_toggle_local;     // detect changes in req_toggle by storing a local copy
    logic new_request_6mhz;     // high for one clk_6mhz cycle when new request detected

    always_ff @(posedge clk_6mhz or negedge reset_n) begin
        if (~reset_n) begin
            req_toggle_local <= 1'b0;
        end else begin
            req_toggle_local <= req_sync1;
        end
    end
    assign new_request_6mhz = (req_sync1 != req_toggle_local);


    logic        busy;          // high when transmitting, controls main 2-state FSM & sck generation

    logic [15:0] shift_reg;     // holds data being shifted out
    logic [4:0]  bit_count;     // # remaining bits, 16 -> 0
    logic        sck_enable;    // toggles to generate sck edges
    
    // sck generation: toggle when busy (6 MHz / 2 = 3 MHz SCK)
    always_ff @(posedge clk_6mhz or negedge reset_n) begin
        if (~reset_n) begin
            busy <= 1'b0;

            shift_reg <= 16'h0000;
            bit_count <= 5'd0;

            sck_enable <= 1'b0;
            sdo <= 1'b0;
            sck <= 1'b0;
        end else begin
            if (~busy) begin
                // not busy: idle low (mode 0)
                sck <= 1'b0;                    
                if (new_request_6mhz) begin
                    // load new data into shift register & start transmission
                    shift_reg <= pcm_latched;   // pcm_latched is stable due to handshake
                    bit_count <= 5'd16;         // 16 bits to send
                    busy <= 1'b1;               // enter busy state
                    sck_enable <= 1'b0;         // prep to toggle

                    sdo <= pcm_latched[15];     // output MSB first
                end
            end else begin
                // busy state: transmitting data & toggle sck_enable every cycle
                sck_enable <= ~sck_enable;          // enable sck toggling

                if (~sck_enable) begin       // POSEDGE of SCK: MCU samples here
                    sck <= 1'b1;
                end else begin                      // NEGEDGE of SCK: shift data here
                   sck <= 1'b0; 
				   bit_count <= bit_count - 1'b1;
				   
				   if (bit_count == 5'd1) begin 	// finished transmitting last bit
					   busy <= 1'b0;
					   sdo <= 1'b0;
					end else begin
                        shift_reg <= {shift_reg[14:0], 1'b0};       // shift left
                        sdo <= shift_reg[14];                       // next bit to output
                    end
                end
            end
        end
    end
	
	assign debug1 = sck_enable;
	assign debug2 = busy;
endmodule