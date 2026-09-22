`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 12:13:18 PM
// Design Name: 
// Module Name: minor1_ques2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module minor1_ques2(
    input clk,rst,
    output reg a,b
    );

always@(posedge clk)begin
if (rst)
begin
a=0;
b=1;
end
else begin
a<=b;
b<=a;
    end
end
endmodule
