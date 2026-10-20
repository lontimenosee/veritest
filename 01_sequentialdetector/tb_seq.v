// =====================================================================================================================
// Copyright   : TODO - confirm copyright owner (not in original file).
// Designer    : TODO - original designer was not provided.
// Project     : Verilog RTL exercises
// Create Date : TODO - original creation date was not provided.
// Description : Serial input stimulus and clock for SEQUENTIALDETECTOR.
// =====================================================================================================================
`timescale 1ns/10ps
`ifndef TB_SEQ_V
`define TB_SEQ_V

module TB_SEQ
   (
   );

// Testbench signals
// ---------------------------------------------------------------------------------------------------------------------
reg                                              clk;
reg                                              rst_n;
reg                                              seq;
wire                                             valid;

// Clock and reset initialization
// ---------------------------------------------------------------------------------------------------------------------
initial
begin : INIT_PROC
  clk                   = 1'b0;
  rst_n                 = 1'b0;
end

// Clock generator: period is 20 ns
// ---------------------------------------------------------------------------------------------------------------------
always #10
begin : CLOCK_PROC
  clk                   <= ~clk;
end

// Serial stimulus (delays are unchanged from the original TB)
// ---------------------------------------------------------------------------------------------------------------------
initial
begin : STIMULUS_PROC
  #1000 rst_n           = 1'b1;
  seq                   = 1'b1;
  #20 seq               = 1'b0;
  #20 seq               = 1'b0;
  #20 seq               = 1'b1;
  #20 seq               = 1'b1;
  #20 seq               = 1'b0;
  #20 seq               = 1'b1;
  #20 seq               = 1'b1;
  #20 seq               = 1'b0;
  #20 seq               = 1'b0;
  #20 seq               = 1'b1;
  #20 seq               = 1'b0;
  #20 seq               = 1'b0;
  #20 seq               = 1'b1;
  #20 seq               = 1'b1;
  #20 seq               = 1'b0;
  $finish;
end

// Device under test
// ---------------------------------------------------------------------------------------------------------------------
SEQUENTIALDETECTOR
   U_SEQUENTIALDETECTOR
   (
   .clk                                (clk                                    ),
   .rst_n                              (rst_n                                  ),
   .seq                                (seq                                    ),
   .valid                              (valid                                  )
   );

endmodule

// =====================================================================================================================
// Modified history
// ---------------------------------------------------------------------------------------------------------------------
// Version      | Date       | Designer     | Description
// Style-only   | 2026-10-20 | Not specified | Coding-standard formatting; logic retained
// =====================================================================================================================
`endif  // TB_SEQ_V
