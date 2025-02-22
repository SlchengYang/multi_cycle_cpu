`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:31:02
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,
    input Reset,
    input WE,    
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    
    reg [31:0] file [1:31];
    integer i;
    
    always @(negedge clk or negedge Reset) begin
        if(Reset == 0) begin
            for(i = 1; i <= 31; i=i+1) begin
                file[i] <= 0;
            end
        end
        else if(WE == 1 && WriteReg != 0)
            file[WriteReg] <= WriteData;
    end
    
        assign ReadData1 = (ReadReg1 == 0) ? 0 : file[ReadReg1];
        assign ReadData2 = (ReadReg2 == 0) ? 0 : file[ReadReg2];
    
endmodule

