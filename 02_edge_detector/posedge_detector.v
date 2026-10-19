`timescale 1ns/10ps
module posedge_detector (
    input wire clk,
    input wire rst_n,
    input wire signal_in,
    output reg signal_out
);
    reg signal_in_d;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            signal_in_d <= 1'b0;
            signal_out <= 1'b0;
        end else begin
            signal_in_d <= signal_in;
            signal_out <= signal_in & ~signal_in_d; // Detect rising edge
        end
    end
endmodule