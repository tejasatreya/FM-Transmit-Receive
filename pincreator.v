`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2018 03:00:39 PM
// Design Name: 
// Module Name: pincreator
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


module pincreator(clk,codecdata,pincr);
    input [16:0]codecdata;
    input clk;
    output [39:0]pincr;
 
   blk_mem_gen_1 phaseincrement (
      .clka(clk),    // input wire clka
      .ena(1'b1),      // input wire ena
      .wea(1'b0),      // input wire [0 : 0] wea
      .addra(codecdata),  // input wire [15 : 0] addra
      .dina(40'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000),    // input wire [39 : 0] dina
      .douta(pincr)  // output wire [39 : 0] douta
    );
            
endmodule
