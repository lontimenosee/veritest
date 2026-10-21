`timescale 1ns/10ps

module tb_clock_div( );

reg clk;
reg rst_n;
wire clk_odd;
wire clk_even;

initial begin
  clk = 1'b0;
  rst_n = 1'b0;
  #20 rst_n = 1'b1;
  #2000 $finish;
end

always #5 clk = ~clk;

CLOCK_DIV #(
    .DIVISOR(5)
) u_CLOCK_DIV (
    .clk(clk),
    .rst_n(rst_n),
    .clk_out(clk_odd)
);

CLOCK_DIV #(
    .DIVISOR(4)
) u_CLOCK_DIV2 (
    .clk(clk),
    .rst_n(rst_n),
    .clk_out(clk_even)
);

endmodule
