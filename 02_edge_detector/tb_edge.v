`timescale 1ns/10ps
module tb_edge();

reg clk;
reg rst_n;
reg signal_in;
wire negsignal;
wire possignal;

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // 100MHz clock
end

initial begin
    rst_n = 1'b0;
    signal_in = 1'b0;
    #20 rst_n = 1'b1; // Release reset after 20 time units

    // Test sequence
    #10 signal_in = 1'b1; // Rising edge
    #10 signal_in = 1'b0; // Falling edge
    #10 signal_in = 1'b1; // Rising edge
    #10 signal_in = 1'b0; // Falling edge
    #10 signal_in = 1'b1; // Rising edge
    #10 signal_in = 1'b0; // Falling edge

    #20 $finish; // End simulation after some time
end


negedge_detector negedge_detector_inst(
    .clk(clk),
    .rst_n(rst_n),
    .signal_in(signal_in),
    .signal_out(negsignal)
);

posedge_detector posedge_detector_inst(
    .clk(clk),
    .rst_n(rst_n),
    .signal_in(signal_in),
    .signal_out(possignal)
);

endmodule