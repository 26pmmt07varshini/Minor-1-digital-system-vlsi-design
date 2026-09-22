`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2026 13:28:23
// Design Name: 
// Module Name: minor1_q5
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


module vending_machine(
    input clk,
    input rst,
    input coin5,
    input coin10,
    output reg dispense
);

reg [1:0] state;

parameter S0  = 2'b00,
          S5  = 2'b01,
          S10 = 2'b10;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= S0;
        dispense <= 1'b0;
    end
    else begin
        dispense <= 1'b0;

        case (state)

            S0: begin
                if (coin5)
                    state <= S5;
                else if (coin10)
                    state <= S10;
            end

            S5: begin
                if (coin5)
                    state <= S10;
                else if (coin10) begin
                    state <= S0;
                    dispense <= 1'b1;
                end
            end

            S10: begin
                if (coin5) begin
                    state <= S0;
                    dispense <= 1'b1;
                end
            end

            default: state <= S0;

        endcase
    end
end

endmodule