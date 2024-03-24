`timescale 1ns / 1ps

module tb();
    parameter half_cycle=10;
    parameter period = 30;
    
    reg clk, rst, T, D, L, R;
    wire [6:0] SSG_D;
    wire [2:0] SSG_EN;
    
    
    code uut(clk, rst, T, D, L, R, SSG_D, SSG_EN);
        
    initial begin
        rst = 0;
        clk = 0;
        T = 0; 
        D = 0;
        L = 0;
        R = 0;
    end
    
    always
        #half_cycle clk=!clk;
        
    initial begin
    
        // correct pattern
        #50 rst=1;
        #50 rst=0;
        
        #period T=1;
        #period T=0;
        
        #period L=1;
        #period L=0;
        
        #period L=1;
        #period L=0;
        
        #period R=1;
        #period R=0;
        
        // incorrect pattern
        #100 rst=1;
        #50 rst=0;
        
        #period D=1;
        #period D=0;
        
        #period L=1;
        #period L=0;
        
        #period L=1;
        #period L=0;
        
        #period R=1;
        #period R=0;
        
        #200 $finish;
    end
endmodule
