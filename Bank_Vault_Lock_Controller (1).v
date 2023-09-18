`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 05:10:28 PM
// Design Name: 
// Module Name: Bank_Vault_Lock_Controller
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


module Bank_Vault_Lock_Controller(
    input clk, //system clock 100 MHz
    input P, //President
    input [1:0] VP,//VicePresidents
    input Open, //Bank Open (1) or Closed (0)
	 
    output reg [7:0] LED, //starts blinking when unlock
    output Unlock //stays solid, right most led on Basys 3 Board
        );
	wire slow_clock;	  
		  integer i;
   initial begin 
	for(i=0;i<8;i=i+1)begin
	LED[i] =0;
	end
	end
  //led assign to indicate whether the Vault is UNLOCK or not. Led ON means Vault Unlocked    
    assign Unlock = (P&VP[1]) | (P&VP[0]) | (Open&P) | (Open&VP[1]&VP[0]);
    
    //slow clock 0.5s for blinking leds, when Vault is unlocked/open
     
    clock_half_sec U0(.clk(clk),.clock_half(slow_clock)); ////slow clock 1s for blinking leds
    
   //led blinking when Vault is unlock
   
    always @(negedge slow_clock)begin //half a second
    
	 if ((P&&VP[1]) || (P&&VP[0]) || (Open&&P) || (Open&&VP[1]&&VP[0]) == 1)
    begin
	
    LED <= ~LED;
	
    end
    else begin
    LED<=15'b0000000000000000;
	
    end
     end    
endmodule
