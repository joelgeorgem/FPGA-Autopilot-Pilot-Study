`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 15:36:51
// Design Name: 
// Module Name: PWM_Custom
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


module PWM_Custom #(
parameter R = 16,
parameter TIMER_BITS = 2)
(
  input clk,
  input rst,
  input clk_en,
  input [R-1:0] duty_channel_int, // actual duty is this divided by max count
  input [TIMER_BITS-1:0] Final_value,
  output pwm_out

    );
    
    
    
    wire tick;
    // up counter for channel 1
    // sequential and combinational circuit separate coding style 
    
    // internal reg declaration
    reg [R-1:0] Q_reg;
    reg [R-1:0] Q_next;
    reg d_reg;
    reg d_next;
    //wire need_to_warp;
    
    // state reg with asych reset
    always@(posedge clk or rst)
    begin
         if(~rst)
           begin
            Q_reg <= 1'b0;
            d_reg <= 1'b0;
           end
         else if (tick)
                begin
                  Q_reg <= Q_next;
                  d_reg <= d_next;
                end
              else 
              begin
                  Q_reg <= Q_reg;
                  d_reg <= d_reg;
              end
    end
    
    
    // next state logic
    always@(*)
    begin 
         Q_next = Q_reg + 1'b1;
         d_next = Q_reg < duty_channel_int;
    end
    
    
    // Output logic
     assign pwm_out = d_next ;
     
    // assign need_to_warp = Q_reg == 15'b100111000100000; // reset counter when conter register stores 20,000
     
     
     Timer #(.BITS(TIMER_BITS)) timer_i(
     .clk(clk),
     .rst(rst),
     .enable(1'b1),
     .Final_value(Final_value),
     .done(tick)
     );
    
endmodule
