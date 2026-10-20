// =====================================================================================================================
// Copyright   : TODO - confirm copyright owner (not in original file).
// Designer    : TODO - original designer was not provided.
// Project     : Verilog RTL exercises
// Create Date : TODO - original creation date was not provided.
// Description : Register a rising-edge indication from signal_in.
// =====================================================================================================================
`ifndef POSEDGE_DETECTOR_V
`define POSEDGE_DETECTOR_V

module POSEDGE_DETECTOR
   (
   input wire                                    clk,                          // Clock
   input wire                                    rst_n,                        // Active-low asynchronous reset
   input wire                                    signal_in,                    // Signal to be monitored
   output reg                                    signal_out                    // Registered rising-edge pulse
   );

// Signal declarations
// ---------------------------------------------------------------------------------------------------------------------
reg                                              signal_in_d;

// Register previous input and rising-edge indication
// ---------------------------------------------------------------------------------------------------------------------
always @(posedge clk or negedge rst_n)
begin : EDGE_DETECT_PROC
  if (rst_n == 1'b0)
  begin
    signal_in_d         <= 1'b0;
    signal_out          <= 1'b0;
  end
  else
  begin
    signal_in_d         <= signal_in;
    signal_out          <= signal_in & ~signal_in_d;
  end
end

endmodule

// =====================================================================================================================
// Modified history
// ---------------------------------------------------------------------------------------------------------------------
// Version      | Date       | Designer     | Description
// Style-only   | 2026-10-20 | Not specified | Coding-standard formatting; logic retained
// =====================================================================================================================
`endif  // POSEDGE_DETECTOR_V
