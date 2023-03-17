`timescale 1ns / 1ps
//Khb

module box_mover(
    input clk,
    input rst_n,
    input [2:0]swin,
    input R,
    input G,
    input B,
    input [x_width-1:0] sx,  // horizontal screen position
    input [y_width-1:0] sy,  // vertical screen position
    input hsync,     // horizontal sync
    input vsync,     // vertical sync
    input de,
    output wire hsout,
    output wire vsout,
    output wire [3:0] Rout,
    output wire [3:0] Gout,
    output wire [3:0] Bout
    );
    reg [x_width-1:0] posx;
    reg [y_width-1:0] posy;
    parameter total_pixel=1920;
    parameter total_line=1080;
    parameter box_size = 350;
    parameter x_width = $clog2(Total_Pixels-1);
    parameter y_width = $clog2(Total_Lines-1);
    parameter Total_Pixels=2200;
    parameter Total_Lines=1125;
    parameter strt_pntx = total_pixel/2-box_size/2-1;
    parameter strt_pnty = total_line/2-box_size/2-1;
    parameter end_pntx = total_pixel-box_size-1-10;
    parameter end_pnty = total_line-box_size-1-10;
//    always@(posedge clk)begin
//        hsout<=hsync;
//        vsout<=vsync;
//    end
    assign hsout=hsync;
    assign vsout=vsync;
    reg Ron,Gon,Bon;
    
    wire pixon;
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            posx<=strt_pntx;
            posy<=strt_pnty;
        end
        else if(swin==1)begin
            if(posx>=end_pntx)begin
                posx<=posx;
            end
            else begin
                posx<=posx+10;
            end
        end
        else if(swin==2)begin
            if(posy>=end_pnty)begin
                posy<=posy;
            end
            else begin
                posy<=posy+10;
            end
        end
        else if(swin==3)begin
            if(posx<=10)begin
                posx<=posx;
            end
            else begin
                posx<=posx-10;
            end
        end
        else if(swin==4)begin
            if(posy<=10)begin
                posy<=posy;
            end
            else begin
                posy<=posy-10;
            end
        end
    end
    
    always @ (posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            Ron<=0;
            Gon<=0;
            Bon<=0;
        end
        else begin
            Ron<=R;
            Gon<=G;
            Bon<=B;
        end 
    end
    
    assign pixon=(posx<=sx&&posx+box_size>sx)&&(posy<=sy&&posy+box_size>sy);
    
    assign Rout[0]=de?((pixon)?Ron:1):0;
    assign Rout[1]=de?((pixon)?Ron:1):0;
    assign Rout[2]=de?((pixon)?Ron:1):0;
    assign Rout[3]=de?((pixon)?Ron:1):0;
    
    assign Bout[0]=de?((pixon)?Bon:1):0;
    assign Bout[1]=de?((pixon)?Bon:1):0;
    assign Bout[2]=de?((pixon)?Bon:1):0;
    assign Bout[3]=de?((pixon)?Bon:1):0;
    
    assign Gout[0]=de?((pixon)?Gon:1):0;
    assign Gout[1]=de?((pixon)?Gon:1):0;
    assign Gout[2]=de?((pixon)?Gon:1):0;
    assign Gout[3]=de?((pixon)?Gon:1):0;
    
//    assign Rout[0]=pixon?Ron:1;
//    assign Rout[1]=de?((pixon)?Ron:1):0;
//    assign Rout[2]=de?((pixon)?Ron:1):0;
//    assign Rout[3]=de?((pixon)?Ron:1):0;
    
//    assign Bout[0]=de?((pixon)?Bon:1):0;
//    assign Bout[1]=de?((pixon)?Bon:1):0;
//    assign Bout[2]=de?((pixon)?Bon:1):0;
//    assign Bout[3]=de?((pixon)?Bon:1):0;
    
//    assign Gout[0]=de?((pixon)?Gon:1):0;
//    assign Gout[1]=de?((pixon)?Gon:1):0;
//    assign Gout[2]=de?((pixon)?Gon:1):0;
//    assign Gout[3]=de?((pixon)?Gon:1):0;
    
//    assign Rout[0]=1;
//    assign Rout[1]=1;
//    assign Rout[2]=1;
//    assign Rout[3]=1;
    
//    assign Bout[0]=1;
//    assign Bout[1]=1;
//    assign Bout[2]=1;
//    assign Bout[3]=1;
    
//    assign Gout[0]=1;
//    assign Gout[1]=1;
//    assign Gout[2]=1;
//    assign Gout[3]=1;
    
endmodule
