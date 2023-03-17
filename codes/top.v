`timescale 1ns / 1ps
//Kang

module top(
    input wire clkt,
    input wire rstt,
    input wire Rin,
    input wire Gin,
    input wire Bin,
    input wire lftin,
    input wire rgtin,
    input wire upin,
    input wire dnin,
    output wire [0:3]Rout,
    output wire [0:3]Gout,
    output wire [0:3]Bout,
    output wire hsyncout,
    output wire vsyncout
    );
    parameter x_width = $clog2(Total_Pixels-1);
    parameter y_width = $clog2(Total_Lines-1);
    parameter Total_Pixels=2200;
    parameter Total_Lines=1125;
    parameter box_size = 350;

    
    wire rst_n;
    wire [2:0] switch_top;
    wire Rt,Gt,Bt;
    wire [x_width-1:0] sxt;
    wire [x_width-1:0]  syt;
    wire hsync_mid;
    wire vsync_mid;
    wire de_mid;
    
    
    switch_interface si(
        .clk(clkt),
        .rst(rstt),
        .rst_n(rst_n),
        .Red(Rin),
        .Grn(Gin),
        .Blu(Bin),
        .lft(lftin),
        .rgt(rgtin),
        .up(upin),
        .dn(dnin),
        .switch_out(switch_top),
        .R(Rt),
        .B(Bt),
        .G(Gt)
    );
    
    vh_ctrl vc(
        .clk(clkt),
        .rst_n(rst_n),
        .sx(sxt),
        .sy(syt),
        .hsync(hsyncout),
        .vsync(vsyncout),
        .de(de_mid)
    );
    
    box_mover bm(
        .clk(clkt),
        .rst_n(rst_n),
        .swin(switch_top),
        .R(Rt),
        .G(Gt),
        .B(Bt),
        .sx(sxt),
        .sy(syt),
        .hsync(hsync_mid),
        .vsync(vsync_mid),
        .de(de_mid),
        .hsout(hsyncout),
        .vsout(vsyncout),
        .Rout(Rout),
        .Gout(Gout),
        .Bout(Bout)
    );
endmodule
