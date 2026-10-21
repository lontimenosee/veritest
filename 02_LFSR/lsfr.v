
`ifndef LFSR_V
`define LFSR_V

module LFSR
   (
   input  wire                                  clk,       // Clock
   input  wire                                  rst_n,     // Active-low asynchronous reset
   output wire                                  lfsr_out  // LFSR serial output
   );

reg  [7:0] lfsr_reg;
wire [7:0] lfsr_shifter;

// Galois LFSR feedback logic
assign lfsr_shifter = (lfsr_reg >> 1) ^
                      (lfsr_reg[0] ? 8'hB8 : 8'h00);

// LFSR state register
always @(posedge clk or negedge rst_n) begin : LFSR_REG_PROC
    if (rst_n == 1'b0) begin
        lfsr_reg <= 8'h01;
    end
    else begin
        lfsr_reg <= lfsr_shifter;
    end
end

// Serial output
assign lfsr_out = lfsr_reg[0];

endmodule

`endif
