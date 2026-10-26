module parity_check_parallel (
    input  wire [7:0] data_in,
    output wire       parity_out
);

    assign parity_out = ^data_in; // parity_out 为1，则输入数据中1的个数为奇数，为0则为偶数
endmodule