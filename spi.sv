/////////////////////////////////////////////
// pcm_spi_tx
//   SPI transmitter for 16-bit PCM audio data
//   FPGA asserts CS when new data is ready
//   MCU clocks out 16 bits, MSB first
//   SPI Mode 0: CPOL=0, CPHA=0
/////////////////////////////////////////////
module pcm_spi_tx(
    input  logic        sck,          // SPI clock (from MCU)
    output logic        sdo,          // Serial data out (MISO)
    output logic        cs_n,         // Chip select (active low)
    input  logic [15:0] pcm_data,     // 16-bit PCM sample
    input  logic        pcm_valid     // Pulse when pcm_data is ready
);

    logic [15:0] shift_reg;           // Shift register for transmission
    logic [4:0]  bit_count;           // Counts bits transmitted (0-15)
    logic        transmitting;        // Transmission in progress flag
    logic        pcm_valid_sync;      // Synchronized pcm_valid
    logic        pcm_valid_prev;      // Previous pcm_valid for edge detection
    
    // Synchronize and edge-detect pcm_valid (assumes pcm_valid is a pulse)
    always_ff @(posedge sck) begin
        pcm_valid_sync <= pcm_valid;
        pcm_valid_prev <= pcm_valid_sync;
    end
    
    wire pcm_valid_edge = pcm_valid_sync & ~pcm_valid_prev;
    
    // Main transmission control
    always_ff @(posedge sck) begin
        if (pcm_valid_edge && !transmitting) begin
            // Capture new PCM data and start transmission
            shift_reg <= pcm_data;
            bit_count <= 0;
            transmitting <= 1'b1;
        end
        else if (transmitting) begin
            if (bit_count < 15) begin
                // Shift out data
                shift_reg <= {shift_reg[14:0], 1'b0};
                bit_count <= bit_count + 1;
            end
            else begin
                // Transmission complete
                transmitting <= 1'b0;
            end
        end
    end
    
    // Chip select: active low during transmission
    assign cs_n = ~transmitting;
    
    // Serial data output: MSB of shift register
    assign sdo = transmitting ? shift_reg[15] : 1'b0;

endmodule