`timescale 1ns/10ps
module TB_SHIFTER();

reg clk;
reg rst_n;
reg seq;
wire valid;

initial begin
    clk = 1'b0;
    rst_n = 1'b0;
end

always #10 clk <= ~clk;

initial begin
    #1000 
    rst_n = 1'b1;
    seq = 1'b1;
    #20 seq = 1'b0;
    #20 seq = 1'b0; 
    #20 seq = 1'b1;
    #20 seq = 1'b1;
    #20 seq = 1'b0;
    #20 seq = 1'b1;
    #20 seq = 1'b1;
    #20 seq = 1'b0;
    #20 seq = 1'b0;
    #20 seq = 1'b1;
    #20 seq = 1'b0;
    #20 seq = 1'b0;
    #20 seq = 1'b1;
    #20 seq = 1'b1;
    #20 seq = 1'b0;
    $finish;
end

shifter U_SHIFTER(
    .clk (clk),
    .rst_n(rst_n),
    .seq(seq),
    .valid(valid)
);

endmodule
