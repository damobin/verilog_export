// iic_host v    
// iic host 负责提供时钟同时先发起通信
// iic host 需要有 1.主动连接功能
//                 2.选择需要通信的丛机地址  自主选择权
//				   3.
module IIC_HOST(
 input  wire clk,
 input  wire reset,
 output reg sda,
 output reg scl
);
/*
always@(posedge clk or negedge reset) begin
    if(~reset)
         count <= 4'b0000;
    else if(enable)
         count <= count + 1'b1;
end
*/
//这是一个硬件电路，等待调用   受体
always@(posedge clk or negedge reset) begin
	scl <= 1'b1;
	sda <= 1'bz;
end

//起始信号



endmodule
