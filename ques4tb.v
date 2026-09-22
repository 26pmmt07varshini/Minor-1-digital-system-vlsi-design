`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 01:40:38 PM
// Design Name: 
// Module Name: ques4tb
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

module tb_room_light;

    reg clk;
    reg reset;
    reg occupancy;
    reg is_dark;
    reg manual_on;

    wire light_on;
    wire light_latch;

    // Instantiate DUT
    room_light dut (
        .clk(clk),
        .reset(reset),
        .occupancy(occupancy),
        .is_dark(is_dark),
        .manual_on(manual_on),
        .light_on(light_on),
        .light_latch(light_latch)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        occupancy = 0;
        is_dark = 0;
        manual_on = 0;

        // Reset
        #10;
        reset = 0;

        // Person enters and it is dark
        #10;
        occupancy = 1;
        is_dark = 1;

        // Wait for clock
        #10;

        // Remove occupancy/dark condition
        occupancy = 0;
        is_dark = 0;

        // Check that latch keeps light ON
        #20;

        // Manual override
        manual_on = 1;
        #10;

        // Release manual switch
        manual_on = 0;
        #20;

        // Reset clears latch
        reset = 1;
        #10;
        reset = 0;

        #10;
        $finish;
    end
endmodule
