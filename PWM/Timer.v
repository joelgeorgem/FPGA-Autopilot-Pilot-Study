//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 10.06.2026 16:10:34
//// Design Name: 
//// Module Name: Timer
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module Timer #(
//parameter BITS = 2)(

//input clk,
//input rst,
//input enable,
//input [BITS-1:0] Final_value,
//output done

//    );
    
//   reg [BITS-1:0] Q_reg; 
//   reg [BITS-1:0] Q_next; 
//always@(posedge clk, negedge rst)
//begin
//     if (~rst)
//        Q_reg <= 1'b0;
//     else if (enable)
//             Q_reg <= Q_next;
//          else 
//               Q_reg <= Q_reg;
//end
    
//endmodule






module Timer #(
    parameter BITS = 2
)(
    input clk,
    input rst,
    input enable,
    input [BITS-1:0] Final_value,
    output done
);

    reg [BITS-1:0] Q_reg;
    reg [BITS-1:0] Q_next;
    wire warp;

    always @(posedge clk or negedge rst) begin
        if (~rst|done)
            Q_reg <= 0;
        else if (enable)
            Q_reg <= Q_next;
    end

    always @(*) begin
        if (done)
            Q_next = 0;
        else
            Q_next = Q_reg + 1'b1;
    end

    assign done = (Q_reg == Final_value);
    

endmodule