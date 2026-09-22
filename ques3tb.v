`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 01:03:36 PM
// Design Name: 
// Module Name: ques3tb
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

module tb_seat_belt_warning;

    reg clk;
    reg reset;
    reg ignition;
    reg seat_belt_unbuckled;

    wire buzzer;

    // Instantiate DUT
    minor1_ques3 dut (
        .clk(clk),
        .reset(reset),
        .ignition(ignition),
        .seat_belt_unbuckled(seat_belt_unbuckled),
        .buzzer(buzzer)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        ignition = 0;
        seat_belt_unbuckled = 0;

        // Reset
        #10;
        reset = 0;

        // Ignition ON, seat belt unbuckled
        #10;
        ignition = 1;
        seat_belt_unbuckled = 1;

        // Wait for counter to reach MAX_COUNT
        #70;

        // Buckle the seat belt
        seat_belt_unbuckled = 0;

        #20;

        // Stop simulation
        $finish;
    end


endmodule