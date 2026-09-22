`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 12:20:35 PM
// Design Name: 
// Module Name: ques2tb
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


module ques2tb();

reg clk,rst;
wire a,b;

minor1_ques2 uut(clk,rst,a,b);
initial
begin
forever #5 clk=~clk;
end

initial begin
clk=1;
rst=1;

#10 rst=0;
$display("initial values a=%d, b=%d",a,b);
#10
$display("final values a=%d, b=%d",a,b);
#10
$finish;

end

endmodule
