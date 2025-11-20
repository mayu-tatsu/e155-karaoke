// spi_audio_tx.sv
// SPI transmitter for 16-bit PCM audio output to MCU
// FPGA acts as SPI slave, MCU is master
// Mayu Tatsumi; mtatsumi@g.hmc.edu
// Quinn Miyamoto; qmiyamoto@g.hmc.edu
// 2025-11-17

module spi_audio_tx (
    // System signals
    input  logic               clk,          // FPGA system clock
    input  logic               reset_n,      // Active-low reset
    
    // Audio input
    input  logic signed [15:0] audio_sample, // 16-bit PCM from FIR filter
    input  logic               sample_valid, // New sample available (16 kHz strobe)
    
    // SPI interface (slave mode - MCU is master)
    input  logic               spi_sclk,     // SPI clock from MCU
    input  logic               spi_cs_n,     // Chip select from MCU (active low)
    output logic               spi_miso      // Data to MCU (Master In Slave Out)
);

    // Internal registers
    logic [15:0] sample_buffer;    // Holds current audio sample
    logic [15:0] shift_reg;        // Shift register for serial output
    logic [3:0]  bit_counter;      // Counts bits transmitted (0-15)
    logic        sample_ready;     // Flag indicating new sample is buffered
    
    // CDC (Clock Domain Crossing) for sample_valid
    logic sample_valid_sync1, sample_valid_sync2;
    
    //=========================================================================
    // Sample Buffer - Captures audio samples in system clock domain
    //=========================================================================
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            sample_buffer <= 16'd0;
            sample_ready <= 1'b0;
        end else begin
            if (sample_valid) begin
                sample_buffer <= audio_sample;
                sample_ready <= 1'b1;  // Mark that new sample is ready
            end else if (~spi_cs_n && bit_counter == 4'd15) begin
                sample_ready <= 1'b0;  // Clear after sample is transmitted
            end
        end
    end
    
    //=========================================================================
    // SPI Transmitter - Operates in SPI clock domain
    //=========================================================================
    always_ff @(posedge spi_sclk or negedge reset_n) begin
        if (~reset_n) begin
            shift_reg <= 16'd0;
            bit_counter <= 4'd0;
            spi_miso <= 1'b0;
        end else begin
            if (~spi_cs_n) begin
                // Chip select is active - transmit data
                
                // On first bit (bit_counter == 0), load the sample
                if (bit_counter == 4'd0) begin
                    shift_reg <= sample_buffer;
                end
                
                // Output MSB on MISO
                spi_miso <= shift_reg[15];
                
                // Shift left for next bit
                shift_reg <= {shift_reg[14:0], 1'b0};
                
                // Increment bit counter
                if (bit_counter == 4'd15) begin
                    bit_counter <= 4'd0;  // Wrap after 16 bits
                end else begin
                    bit_counter <= bit_counter + 1;
                end
                
            end else begin
                // Chip select inactive - idle state
                bit_counter <= 4'd0;
                spi_miso <= 1'b0;  // Output low when idle
            end
        end
    end

endmodule