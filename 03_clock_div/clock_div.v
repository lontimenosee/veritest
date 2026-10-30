`ifndef CLOCK_DIV_V
`define CLOCK_DIV_V

module CLOCK_DIV #(
  parameter DIVISOR = 2
)
   (
   input  wire                                  clk,       // Clock
   input  wire                                  rst_n,     // Active-low asynchronous reset
   output wire            [7:0]                 clk_out    // Divided clock output
   );

localparam DIV_ODD = (DIVISOR % 2 == 1);
reg clk_up;
reg clk_down;
wire clk_odd;
reg clk_even;

reg [31:0] counter_odd;
reg [31:0] counter_even;

always @(posedge clk or negedge rst_n) 
begin : CLOCK_DIV_PROC
    if (!rst_n || DIV_ODD == 1'b1) begin
        clk_even <= 1'b0;
        counter_even <= 32'd0;
    end
    else if(counter_even != (DIVISOR / 2)) begin
        counter_even <= counter_even + 1;
    end
    else begin
        clk_even <= ~clk_even;
        counter_even <= 32'd0;
    end
end

always @(posedge clk or negedge rst_n)
begin 
    if (!rst_n || DIV_ODD == 1'b0) begin
        counter_odd <= 32'd0;
    end
    else if(counter_odd != (DIVISOR - 1)) begin
        counter_odd <= counter_odd + 1;
    end
    else begin
        counter_odd <= 32'd0;
    end
end


always @(posedge clk or negedge rst_n)
begin 
    if (!rst_n || DIV_ODD == 1'b0) begin
        clk_up <= 1'b0;
    end
    else if(counter_odd == ((DIVISOR>>1) - 1)) begin
        clk_up <= 1'b1;
    end
    else if(counter_odd == (DIVISOR - 1)) 
    begin
        clk_up <= 1'b0;  
    end
end

always @(negedge clk or negedge rst_n)
begin : CLOCK_DIV_ODD_PROC
    if (!rst_n || DIV_ODD == 1'b0) begin
        clk_down <= 1'b0;
    end
    else if(counter_odd == ((DIVISOR>>1) - 1)) begin
        clk_down <= 1'b1;
    end
    else if(counter_odd == (DIVISOR - 1)) 
    begin
        clk_down <= 1'b0;
    end
end

assign clk_odd = clk_up & clk_down;
assign clk_out = (DIV_ODD == 1'b1) ? clk_odd :
                 (DIV_ODD == 1'b0) ? clk_even : 1'b0;

endmodule

`endif 