module CRC(
  input        clk,
  input        rst_n,
  input        data_in,
  output       crc_out
);

reg  [7:0] crc_reg;
wire [7:0] crc_next;

assign crc_next = (crc_reg << 1) ^ ((data_in ^ crc_reg[7])? 8'h07 : 8'h00); // Polynomial: x^8 + x^2 + x + 1

always @(posedge clk or negedge rst_n) begin
  if (!rst_n)
    crc_reg <= 8'hFF; // Initialize CRC register to all 1s
  else
    crc_reg <= crc_next;
end

assign crc_out = crc_reg;

endmodule
