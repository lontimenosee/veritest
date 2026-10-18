module SEQUENTIALDETECTOR(
    input clk,
    input rst_n,
    input seq,
    output reg valid
);


// 参数需要初始化
localparam [2:0] state = 3'd0;
localparam IDLE = 3'd0;
localparam C1 = 3'd1;
localparam C2 = 3'd2;
localparam C3 = 3'd3;
localparam C4 = 3'd4;
localparam C5 = 3'd5;

reg [3:0]current_state;
reg [3:0]next_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= IDLE;
        next_state <= IDLE;
    end
    else begin
    current_state <= next_state;
    end
end

// case对应endcase
always @(*) begin

    next_state = IDLE;
    case(current_state) 
    IDLE: begin
        next_state = (seq == 1'b1)? C1:IDLE;
    end

    C1:  begin
        next_state = (seq == 1'b0)? C2:C1;
    end

    C2:  begin
        next_state = (seq == 1'b0)? C3:C1;
    end

    C3:  begin
        next_state = (seq == 1'b1)? C4:C3;
    end

    C4:  begin
        next_state = (seq == 1'b1)? C5:C2;
    end

    C5:  begin
        next_state = (seq == 1'b1)? C1:IDLE;
    end

    default: begin
        next_state = IDLE;
    end
    endcase        
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        valid <= 1'b0;
    end
    else begin
        if((current_state == C5) && (seq == 1'b0)) begin
            valid <= 1'b1;
        end
        valid <= 1'b0;
    end
end



endmodule