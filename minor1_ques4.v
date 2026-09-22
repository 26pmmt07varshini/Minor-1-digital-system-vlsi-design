`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 01:40:03 PM
// Design Name: 
// Module Name: minor1_ques4
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


module room_light (
    input clk,
    input reset,
    input occupancy,
    input is_dark,
    input manual_on,
    output reg light_on,
    output reg light_latch
);

always @(posedge clk) begin

        light_latch <= light_on;
end

always @(*) begin
    light_on = (occupancy && is_dark) || manual_on || light_latch;
end

endmodule
