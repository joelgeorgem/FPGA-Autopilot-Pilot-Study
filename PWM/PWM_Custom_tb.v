`timescale 1ns / 1ps

module PWM_Custom_tb;

    localparam R = 16;
    localparam TIMER_BITS = 2;
    localparam T = 100;

    reg clk;
    reg rst;
    reg clk_en;
    reg [R-1:0] duty_channel_int;
    reg [TIMER_BITS-1:0] Final_value;
    wire pwm_out;

    PWM_Custom #(
        .R(R),
        .TIMER_BITS(TIMER_BITS)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en),
        .duty_channel_int(duty_channel_int),
        .Final_value(Final_value),
        .pwm_out(pwm_out)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #(T/2) clk = ~clk;
    end

initial begin
    Final_value = 2'b10;
    rst = 1'b0;
    clk_en = 1'b0;
    duty_channel_int = 16'd0;

    #20;
    rst = 1'b1;
    clk_en = 1'b1;

    duty_channel_int = 16'd3333;  // 1 ms pulse approx
    repeat (2*(2**R)) @(negedge clk);

    duty_channel_int = 16'd6667;  // 2 ms pulse approx
    repeat (2*(2**R)) @(negedge clk);

    $stop;
end

endmodule