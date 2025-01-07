`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 19:22:12
// Design Name: 
// Module Name: Basys3_CPU
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


module Basys3_CPU(
    input basys3_clock,
    input reset_sw,
    input [1:0] SW_in,
    input next_button,
    output [3:0] enable,
    output [7:0] dispcode
    );
    wire [31:0] currentIAddr, nextIAddr;
    wire [4:0] rs, rt;
    wire [31:0] ReadData1, ReadData2;
    wire [31:0] ALU_result, DataBus;
    wire next_signal;    
    wire [3:0] value;
    top_cpu top_cpu(
        .clk(next_signal),    
        .Reset(Reset),
        .currentIAddr(currentIAddr), .nextIAddr(nextIAddr),
        .rs(rs), .rt(rt),
        .ReadData1(ReadData1), .ReadData2(ReadData2),
        .ALU_result(ALU_result), .DataBus(DataBus)
    );    
     LED LED(
        .clock(basys3_clock),
        .reset(Reset),
        .BTNR(next_signal),
        .SW(SW_in),
        .currentIAddr(currentIAddr), .nextIAddr(nextIAddr),
        .rs(rs), .rt(rt),
        .ReadData1(ReadData1), .ReadData2(ReadData2),
        .ALU_result(ALU_result), .DataBus(DataBus),
        .enable(enable),
        .value(value)
    );
    Button_Debounce Button_Debounce(
        .clk(basys3_clock),
        .button(next_button),
        .out_button(next_signal)
    );
    Button_Debounce reset(
        .clk(basys3_clock),
        .button(reset_sw),
        .out_button(Reset)
    );
    Hex_To_7seg led_seg(
        .hex(value),
        .dispcode(dispcode)
    );
endmodule
