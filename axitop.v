`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2018 10:03:45 AM
// Design Name: 
// Module Name: axitop
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


module axitop(clk_in1,data);
    input clk_in1;
    wire datav,phasev;
    output[15:0]data;
    wire [15:0]codecdata;
    wire[39:0]phase;
    wire [39:0]pinc;
    wire clk1,clk2;
    reg[9:0] addr=10'b0000000000;
    reg[5:0]counter=6'b000000;
    assign clk1=counter[5];
   dds_compiler_0 mydds (
      .aclk(clk2),                                // input wire aclk
      .s_axis_phase_tvalid(1'b1),  // input wire s_axis_phase_tvalid
      .s_axis_phase_tdata(pinc),    // input wire [39 : 0] s_axis_phase_tdata
      .m_axis_data_tvalid(datav),    // output wire m_axis_data_tvalid
      .m_axis_data_tdata(data),      // output wire [15 : 0] m_axis_data_tdata
      .m_axis_phase_tvalid(phasev),  // output wire m_axis_phase_tvalid
      .m_axis_phase_tdata(phase)    // output wire [39 : 0] m_axis_phase_tdata
    );
    
  //  reg [7:0]codecdata_reg=0 ;
  blk_mem_gen_0 audiocodec (
    .clka(clk1),    // input wire clka
    .ena(1'b1),      // input wire ena
    .wea(1'b0),      // input wire [0 : 0] wea
    .addra(addr),  // input wire [9 : 0] addra
    .dina(16'b0000000000000000),    // input wire [15 : 0] dina
    .douta(codecdata)  // output wire [15 : 0] douta
  );
  clk_wiz_0 myclock
     (
     // Clock in ports
      .clk_in1(clk_in1),      // input clk_in1
      // Clock out ports
      .clk_out1(clk2),     // output clk_out1
      .clk_out2(clk_out2),     // output clk_out2
      // Status and control signals
      .reset(reset), // input reset
      .locked(locked));
   ila_0 myprobe (
          .clk(clk2), // input wire clk
      
      
          .probe0(data) // input wire [15:0] probe0
      );   
   always@(posedge clk_out2)
              begin
                  if(counter==6'b111111)
                      counter=6'b000000;
                  else
                      counter=counter+6'b000001;    
              end    
    
   /* always@(*)
    codecdata_reg=codecdata_w ;
    
    assign codecdata=codecdata_reg ;*/
    
    pincreator phase0(clk1,codecdata,pinc);
    always@(posedge clk1)
        begin
            if(addr==10'b0000000010)
                addr=10'b0000000000;
            else
                addr=addr+10'b0000000001;
        end                
endmodule
