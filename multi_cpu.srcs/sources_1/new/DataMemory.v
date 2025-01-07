`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:24:38
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input clk,
    input [31:0] DAddr,
    input [31:0] DataIn,
    input RD,    
    input WR,    
    output [31:0] DataOut    
    );
    
    reg [7:0] RAM [0:63];    
    
    assign DataOut[7:0]   = (RD==1) ? RAM[DAddr+3] : 8'bz;
    assign DataOut[15:8]  = (RD==1) ? RAM[DAddr+2] : 8'bz;
    assign DataOut[23:16] = (RD==1) ? RAM[DAddr+1] : 8'bz;
    assign DataOut[31:24] = (RD==1) ? RAM[DAddr+0] : 8'bz;
    
    always @(negedge clk) begin
        if(WR == 1) begin
            RAM[DAddr+0] <= DataIn[31:24];
            RAM[DAddr+1] <= DataIn[23:16];
            RAM[DAddr+2] <= DataIn[15:8];
            RAM[DAddr+3] <= DataIn[7:0];
        end
    end
endmodule

