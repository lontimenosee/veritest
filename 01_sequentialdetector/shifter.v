`timescale 1ns/10ps
module shifter(
    input clk,
    input rst_n,
    input seq,
    output wire valid
);

reg [4:0]shifter;
    
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shifter <= 5'b00000;
    end else begin
        shifter <= {shifter[3:0], seq};
    end
end

assign valid = (shifter == 5'b10011) ? 1'b1 : 1'b0;

endmodule
