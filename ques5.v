`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 01:54:49 PM
// Design Name: 
// Module Name: ques5
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

`timescale 1ns/1ps

module tb_sliding_door;

    reg clk;
    reg rst_n;
    reg sensor;
    reg door_full_open;
    reg door_full_closed;

    wire [1:0] state;

    // Instantiate DUT
    sliding_door dut (
        .clk(clk),
        .rst_n(rst_n),
        .sensor(sensor),
        .door_full_open(door_full_open),
        .door_full_closed(door_full_closed),
        .state(state)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk = 0;
        rst_n = 0;
        sensor = 0;
        door_full_open = 0;
        door_full_closed = 0;

        // Reset
        #10;
        rst_n = 1;

        // Person detected
        sensor = 1;
        #10;

        // Door reaches fully open
        door_full_open = 1;
        #10;

        // Door is fully open, person walks away
        sensor = 0;
        door_full_open = 0;
        #10;

        // Door reaches fully closed
        door_full_closed = 1;
        #10;

        // Finish
        $finish;
    end


endmodule
