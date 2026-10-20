`ifndef LSFR_V
`define LSFR_V

module LSFR
   (
   input                                         clk,                          // Clock
   input                                         rst_n,                        // Active-low asynchronous reset
   output reg                                    lfsr_out                      // LFSR output
   );

wire [7:0]lfsr_out;

assign lfsr_out = (lfsr_out >> 1) ^ (lfsr_out[0]?8'hB8: 8'h00);

always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n) begin
        lfsr_out <= 1'b0;
    end else begin
        lfsr_out <= lfsr_out[0];
    end
end

endmodule

`endif