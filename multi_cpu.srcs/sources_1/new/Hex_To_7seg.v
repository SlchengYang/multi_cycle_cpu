`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:25:30
// Design Name: 
// Module Name: Hex_To_7seg
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


module Hex_To_7seg(
    input [3:0] hex,
    output reg [7:0] dispcode
    );
    always @(hex) begin
        case(hex)
            4'b0000:dispcode=8'hc0;
            4'b0001:dispcode=8'hf9;
            4'b0010:dispcode=8'ha4;
            4'b0011:dispcode=8'hb0;
            4'b0100:dispcode=8'h99;
            4'b0101:dispcode=8'h92;
            4'b0110:dispcode=8'h82;
            4'b0111:dispcode=8'hf8;
            4'b1000:dispcode=8'h80;
            4'b1001:dispcode=8'h90;
            4'b1010:dispcode=8'h88;
            4'b1011:dispcode=8'h83;
            4'b1100:dispcode=8'hc6;
            4'b1101:dispcode=8'ha1;
            4'b1110:dispcode=8'h86;
            4'b1111:dispcode=8'h8e;
            default: dispcode=8'h00;
        endcase
        end
endmodule

