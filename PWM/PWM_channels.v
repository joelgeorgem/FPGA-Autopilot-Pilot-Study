module PWM_channels(
    input  clk,
    input  rst,
    input  clk_en,

    input  [15:0] duty_int_1,
    input  [15:0] duty_int_2,
    input  [15:0] duty_int_3,
    input  [15:0] duty_int_4,

    output pwm_out_1,
    output pwm_out_2,
    output pwm_out_3,
    output pwm_out_4
);

    localparam [1:0] FINAL_VALUE = 2'd2;

    PWM_Custom #(
        .R(16),
        .TIMER_BITS(2)
    ) pwm_ch1 (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en),
        .duty_channel_int(duty_int_1),
        .Final_value(FINAL_VALUE),
        .pwm_out(pwm_out_1)
    );

    PWM_Custom #(
        .R(16),
        .TIMER_BITS(2)
    ) pwm_ch2 (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en),
        .duty_channel_int(duty_int_2),
        .Final_value(FINAL_VALUE),
        .pwm_out(pwm_out_2)
    );

    PWM_Custom #(
        .R(16),
        .TIMER_BITS(2)
    ) pwm_ch3 (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en),
        .duty_channel_int(duty_int_3),
        .Final_value(FINAL_VALUE),
        .pwm_out(pwm_out_3)
    );

    PWM_Custom #(
        .R(16),
        .TIMER_BITS(2)
    ) pwm_ch4 (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en),
        .duty_channel_int(duty_int_4),
        .Final_value(FINAL_VALUE),
        .pwm_out(pwm_out_4)
    );

endmodule