`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 12:58:05 PM
// Design Name: 
// Module Name: minor1_ques3
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


module minor1_ques3(

    input  clk,
    input  reset,
    input  ignition,
    input  seat_belt_unbuckled,
    output reg buzzer
);

reg [31:0] count;

//parameter MAX_COUNT = 500;   // 5 seconds in clock cycles

always @(posedge clk) begin
    if (reset || !ignition || !seat_belt_unbuckled) begin
        count   <= 0;
        buzzer <= 0;
    end
    else if (count < 5) begin
        count <= count + 1;
        buzzer <= 0;
    end
    else begin
        buzzer <= 1;
    end
end

endmodule

