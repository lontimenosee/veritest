`timescale 1ns/10ps
module tb_crc;

  reg clk;
  reg rst_n;
  reg data_in;
  wire crc_out;

  // Instantiate the CRC module
  CRC uut (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .crc_out(crc_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_n = 0;
    data_in = 0;

    // Apply reset
    #10 rst_n = 1;

    // Apply test data
    #10 data_in = 1; // First bit
    #10 data_in = 0; // Second bit
    #10 data_in = 1; // Third bit
    #10 data_in = 1; // Fourth bit
    #10 data_in = 0; // Fifth bit
    #10 data_in = 1; // Sixth bit
    #10 data_in = 0; // Seventh bit
    #10 data_in = 1; // Eighth bit
    #10 data_in = 0; // Ninth bit
    #10 data_in = 1; // Tenth bit

    // Wait for a few clock cycles to observe the CRC output
    #50;

    // Finish simulation
    $finish;
  end
endmodule