`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:27:04
// Design Name: 
// Module Name: LED
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


module LED(
    input clock,   
    input reset,  
    input BTNR,  
    input [1:0] SW,  
    input [31:0] currentIAddr,
    input [31:0] nextIAddr,
    input [4:0] rs,
    input [4:0] rt,
    input [31:0] ReadData1,
    input [31:0] ReadData2,
    input [31:0] ALU_result,
    input [31:0] DataBus,
    output reg [3:0] enable,
    output reg [7:0] value
    );
    integer n;
    
    initial begin
        n=0;
        enable =4'b0111;
    end

    always @(posedge clock or negedge reset) begin
         if(reset==0)begin
            n=0;
            enable=4'b0111;
         end
         else begin
             if(n<50000) n=n+1;
             else begin
                n=0;
                case(enable)
                    4'b0111: enable=4'b1011;
                    4'b1011: enable=4'b1101;
                    4'b1101: enable=4'b1110;
                    4'b1110: enable=4'b0111; 
                endcase
             end
         end
    end
    
    always @(BTNR or SW)begin
        case(SW)
            2'b00:begin
                case(enable)
                    4'b0111: value=currentIAddr[7:4];
                    4'b1011: value=currentIAddr[3:0];
                    4'b1101: value=nextIAddr[7:4];
                    4'b1110: value=nextIAddr[3:0];
                endcase
            end
            2'b01:begin
                case(enable)
                    4'b0111: value={4'b0000};
                    4'b1011: value=rs[3:0];
                    4'b1101: value=ReadData1[7:4];
                    4'b1110: value=ReadData1[3:0];
                endcase
            end
            2'b10:begin
                case(enable)
                    4'b0111: value={4'b0000};
                    4'b1011: value=rt[3:0];
                    4'b1101: value=ReadData2[7:4];
                    4'b1110: value=ReadData2[3:0];
                endcase
            end
            2'b11:begin
                case(enable)
                    4'b0111: value=ALU_result[7:4];
                    4'b1011: value=ALU_result[3:0];
                    4'b1101: value=DataBus[7:4];
                    4'b1110: value=DataBus[3:0];
                endcase
            end       
        endcase
    end
endmodule

