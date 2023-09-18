`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 05:17:56 PM
// Design Name: 
// Module Name: clock_1s
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


module clock_half_sec( //half a second clock
    input clk, //basys 3 board clock, 100 MHz
    output reg clock_half //half a second clock , 2 Hz
    );
    initial begin 
	 clock_half=0;
	 end
    reg [28:0] count=0;
    
    always@(posedge clk)
    begin
    count<=count+1;
    
    if (count==49_999_999) //50 M, 0 to 499,999,999
    begin
    count<=0;
    clock_half=~clock_half;
   
    end
    end
endmodule
