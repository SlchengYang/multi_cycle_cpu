`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:23:06
// Design Name: 
// Module Name: Button_Debounce
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


module Button_Debounce(
    input clk,
    input button,
    output out_button
    );
parameter T1MS = 5000;
reg [21:0]count_low;
reg [21:0]count_high;
reg out;
always@(posedge clk)
    begin 
        if(button==1'b0)
            count_low = count_low + 1;
        else 
            count_low = 1'b0;
    end
always@(posedge clk)
        begin 
            if(button==1'b1)
                count_high = count_high + 1;
            else
                count_high = 1'b0;
        end
always@(posedge clk)
     begin        
        if(count_low == T1MS)   
           out = 1'b0;
        else if(count_high == T1MS)
            out = 1'b1;
      end
   assign out_button = !out;
endmodule

