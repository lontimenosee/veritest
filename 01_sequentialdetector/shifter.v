`timescale 1ns/10ps
module shifter(
    input clk,
    input rst_n,
    input seq,
    output valid
);

reg [5:0]shifter;

always @(posedge clk or negedge rst_n)