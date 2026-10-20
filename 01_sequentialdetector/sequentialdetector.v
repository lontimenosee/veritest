// =====================================================================================================================
// Copyright   : TODO - confirm copyright owner (not in original file).
// Designer    : TODO - original designer was not provided.
// Project     : Verilog RTL exercises
// Create Date : TODO - original creation date was not provided.
// Description : FSM-based serial sequence detector; transitions retained.
// =====================================================================================================================
`ifndef SEQUENTIALDETECTOR_V
`define SEQUENTIALDETECTOR_V

module SEQUENTIALDETECTOR
   (
   input                                         clk,                          // Clock
   input                                         rst_n,                        // Active-low asynchronous reset
   input                                         seq,                          // Serial input
   output reg                                    valid                         // Registered sequence-detection flag
   );

// State encoding
// ---------------------------------------------------------------------------------------------------------------------
localparam         [2:0] STATE                   = 3'd0;
localparam IDLE                                  = 3'd0;
localparam C1                                    = 3'd1;
localparam C2                                    = 3'd2;
localparam C3                                    = 3'd3;
localparam C4                                    = 3'd4;
localparam C5                                    = 3'd5;

// State registers
// ---------------------------------------------------------------------------------------------------------------------
reg                [3:0]                         current_state;
reg                [3:0]                         next_state;

// Current-state register
// ---------------------------------------------------------------------------------------------------------------------
always @(posedge clk or negedge rst_n)
begin : STATE_PROC
  if (rst_n == 1'b0)
  begin
    current_state       <= IDLE;
  end
  else
  begin
    current_state       <= next_state;
  end
end

// Next-state combinational logic
// ---------------------------------------------------------------------------------------------------------------------
always @(*)
begin : NEXT_STATE_PROC
  next_state            = IDLE;
  case (current_state)
    IDLE:
    begin
      next_state        = (seq == 1'b1) ? C1 : IDLE;
    end
    C1:
    begin
      next_state        = (seq == 1'b0) ? C2 : C1;
    end
    C2:
    begin
      next_state        = (seq == 1'b0) ? C3 : C1;
    end
    C3:
    begin
      next_state        = (seq == 1'b1) ? C4 : IDLE;
    end
    C4:
    begin
      next_state        = (seq == 1'b1) ? C5 : C2;
    end
    C5:
    begin
      next_state        = (seq == 1'b1) ? C1 : C2;
    end
    default:
    begin
      next_state        = IDLE;
    end
  endcase
end

// Registered valid output
// ---------------------------------------------------------------------------------------------------------------------
always @(posedge clk or negedge rst_n)
begin : VALID_PROC
  if (rst_n == 1'b0)
  begin
    valid               <= 1'b0;
  end
  else
  begin
    if (current_state == C5)
    begin
      valid             <= 1'b1;
    end
    else
    begin
      valid             <= 1'b0;
    end
  end
end

endmodule

// =====================================================================================================================
// Modified history
// ---------------------------------------------------------------------------------------------------------------------
// Version      | Date       | Designer     | Description
// Style-only   | 2026-10-20 | Not specified | Coding-standard formatting; logic retained
// =====================================================================================================================
`endif  // SEQUENTIALDETECTOR_V
