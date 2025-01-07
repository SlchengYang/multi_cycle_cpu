`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/23 16:46:45
// Design Name: 
// Module Name: DRALU
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


module DRALU(
    input[2:0] state,
    input clk,
    input [31:0] in,
    output reg [31:0] out
    );
    
    always @(negedge clk) begin
        if(state == 2 || state == 5 || state == 6)
        out = in;
    end
    
endmodule
