// =====================================================================================================================
// Copyright   : TODO - confirm copyright owner (not in original file).
// Designer    : TODO - original designer was not provided.
// Project     : Verilog RTL exercises
// Create Date : TODO - original creation date was not provided.
// Description : Clock and edge stimulus for edge detector RTL modules.
// =====================================================================================================================
`timescale 1ns/10ps
`ifndef TB_EDGE_V
`define TB_EDGE_V

module TB_EDGE
   (
   );

// Testbench signals
// ---------------------------------------------------------------------------------------------------------------------
reg                                              clk;
reg                                              rst_n;
reg                                              signal_in;
wire                                             negsignal;
wire                                             possignal;

// Clock generation
// ---------------------------------------------------------------------------------------------------------------------
initial
begin : CLOCK_PROC
  clk                   = 1'b0;
  forever #5 clk        = ~clk;
end

// Apply reset and edge stimuli
// ---------------------------------------------------------------------------------------------------------------------
initial
begin : STIMULUS_PROC
  rst_n                 = 1'b0;
  signal_in             = 1'b0;
  #20 rst_n             = 1'b1;

  // Edge stimulus sequence
  #10 signal_in         = 1'b1;                                                // Rising edge
  #10 signal_in         = 1'b0;                                                // Falling edge
  #10 signal_in         = 1'b1;                                                // Rising edge
  #10 signal_in         = 1'b0;                                                // Falling edge
  #10 signal_in         = 1'b1;                                                // Rising edge
  #10 signal_in         = 1'b0;                                                // Falling edge

  #20 $finish;
end

// Devices under test
// ---------------------------------------------------------------------------------------------------------------------
NEGEDGE_DETECTOR
   U_NEGEDGE_DETECTOR
   (
   .clk                                (clk                                    ),
   .rst_n                              (rst_n                                  ),
   .signal_in                          (signal_in                              ),
   .signal_out                         (negsignal                              )
   );

POSEDGE_DETECTOR
   U_POSEDGE_DETECTOR
   (
   .clk                                (clk                                    ),
   .rst_n                              (rst_n                                  ),
   .signal_in                          (signal_in                              ),
   .signal_out                         (possignal                              )
   );

endmodule

// =====================================================================================================================
// Modified history
// ---------------------------------------------------------------------------------------------------------------------
// Version      | Date       | Designer     | Description
// Style-only   | 2026-10-20 | Not specified | Coding-standard formatting; logic retained
// =====================================================================================================================
`endif  // TB_EDGE_V
