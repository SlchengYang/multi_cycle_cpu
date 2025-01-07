`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:28:59
// Design Name: 
// Module Name: Mux4
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


module Mux4(
    input [3:0] choice,
    input [3:0] in0, in1, in2, in3,
    output reg [3:0] out
    );
    
    always @(*) begin
        case(choice)
            4'b1110: out <= in0;
            4'b1101: out <= in1;
            4'b1011: out <= in2;
            4'b0111: out <= in3;
        endcase
    end
endmodule

