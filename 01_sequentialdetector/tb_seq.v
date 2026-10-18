module TB_SEQ();

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
end

SEQUENTIALDETECTOR U_SEQ(
    .clk (clk),
    .rst_n(rst_n),
    .seq(seq),
    .valid(valid)
);

endmodule