// =====================================================================================================================
// Copyright   : TODO - confirm copyright owner (not in original file).
// Designer    : TODO - original designer was not provided.
// Project     : Verilog RTL exercises
// Create Date : TODO - original creation date was not provided.
// Description : Five-bit serial shift register and 10011 pattern detector.
// =====================================================================================================================
`ifndef SHIFTER_V
`define SHIFTER_V

module SHIFTER
   (
   input                                         clk,                          // Clock
   input                                         rst_n,                        // Active-low asynchronous reset
   input                                         seq,                          // Serial input
   output wire                                   valid                         // Pattern-match indication
   );

// Signal declarations
// ---------------------------------------------------------------------------------------------------------------------
reg                [4:0]                         seq_history;

// Shift in serial data on each clock edge
// ---------------------------------------------------------------------------------------------------------------------
always @(posedge clk or negedge rst_n)
begin : SHIFT_PROC
  if (rst_n == 1'b0)
  begin
    seq_history         <= 5'b00000;
  end
  else
  begin
    seq_history         <= {seq_history[3:0], seq};
  end
end

// Compare the most recent five bits with the sequence 10011
// ---------------------------------------------------------------------------------------------------------------------
assign valid            = (seq_history == 5'b10011) ? 1'b1 : 1'b0;

endmodule

// =====================================================================================================================
// Modified history
// ---------------------------------------------------------------------------------------------------------------------
// Version      | Date       | Designer     | Description
// Style-only   | 2026-10-20 | Not specified | Coding-standard formatting; logic retained
// =====================================================================================================================
`endif  // SHIFTER_V
