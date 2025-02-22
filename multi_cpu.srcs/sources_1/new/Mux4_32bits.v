`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:30:12
// Design Name: 
// Module Name: Mux4_32bits
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



module Mux4_32bits(
    input [1:0] choice,
    input [31:0] in0, in1, in2, in3,
    output reg [31:0] out
    );
    
    always @(*) begin
        case(choice)
            0: out <= in0;
            1: out <= in1;
            2: out <= in2;
            3: out <= in3;
        endcase
    end
    
endmodule

