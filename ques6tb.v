`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2026 13:29:00
// Design Name: 
// Module Name: ques6tb
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


module vending_tb;

reg clk;
reg rst;
reg coin5;
reg coin10;

wire dispense;

vending_machine dut (
    .clk(clk),
    .rst(rst),
    .coin5(coin5),
    .coin10(coin10),
    .dispense(dispense)
);

// Clock: 10 time-unit period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    // Initial values
    rst = 1;
    coin5 = 0;
    coin10 = 0;

    #10;
    rst = 0;

    // ----------------
    // Test 1: 5 + 10
    // ----------------
    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    #10;
    coin10 = 1;
    #10;
    coin10 = 0;

    // ----------------
    // Test 2: 10 + 5
    // ----------------
    #10;
    coin10 = 1;
    #10;
    coin10 = 0;

    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    // ----------------
    // Test 3: 5+5+5
    // ----------------
    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    #20;
    $finish;
end

endmodule

