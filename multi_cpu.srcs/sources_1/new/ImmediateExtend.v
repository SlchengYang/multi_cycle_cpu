`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:25:57
// Design Name: 
// Module Name: ImmediateExtend
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


module ImmediateExtend(
    input [15:0] original,
    input ExtSel,    
    output reg [31:0] extended
    );
    
    always @(*) begin
        extended[15:0] <= original;    
        if(ExtSel == 0) begin    
            extended[31:16] <= 0;
        end
        else begin    
            if(original[15] == 0) extended[31:16] <= 0;
            else extended[31:16] <= 16'hFFFF;
        end
    end
endmodule

