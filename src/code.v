`timescale 1ns / 1ps

module code(
  input clk,
  input rst,
  input T,
  input D,
  input L,
  input R,
  output [6:0] SSG_D,
  output [2:0] SSG_EN 
  );
  
  parameter   IDLE    =   4'b1001  ;
  parameter   ST1     =   4'b0001  ;
  parameter   ST2     =   4'b0010  ;
  parameter   ST3     =   4'b0011  ;
  parameter   ST4     =   4'b0100  ;
  parameter   E1      =   4'b0101  ;
  parameter   E2      =   4'b0110  ;
  parameter   E3      =   4'b0111  ;
  parameter   E4      =   4'b1000  ;
  
  reg   [3:0]     c_state ;
  reg   [3:0]     n_state ;
  reg   [6:0]     SSG_D   ;
  
  wire T_pressed, D_pressed, L_pressed, R_pressed;
  wire T_EN, D_EN, L_EN, R_EN, ANY_EN; 

  FSM_button top(clk, rst, T, T_pressed);
  FSM_button down(clk, rst, D, D_pressed);
  FSM_button left(clk, rst, L, L_pressed);
  FSM_button right(clk, rst, R, R_pressed);

  assign T_EN = T_pressed && !(D_pressed || L_pressed || R_pressed);
  assign D_EN = D_pressed && !(T_pressed || L_pressed || R_pressed);
  assign L_EN = L_pressed && !(T_pressed || D_pressed || R_pressed);
  assign R_EN = R_pressed && !(T_pressed || D_pressed || L_pressed);
  
  assign ANY_EN = T_pressed || D_pressed || L_pressed || R_pressed;

  always@(*)begin
  case(c_state)
  IDLE   : if(ANY_EN)
	        if(T_EN)
             n_state = ST1;
            else
             n_state = E1;
           else
            n_state = c_state;
  ST1    : if(ANY_EN)
	        if(L_EN)
             n_state = ST2;
            else
             n_state = E2;
           else
          	n_state = c_state; 
  ST2   : if(ANY_EN)
	       if(L_EN)
             n_state = ST3;
            else
             n_state = E3;
           else
            n_state = c_state;
  ST3    : if(ANY_EN)
	        if(R_EN)
             n_state = ST4;
            else
             n_state = E4;
           else
            n_state = c_state;
  ST4    : if (rst) 
            n_state = IDLE;
           else
            n_state = c_state;
  E1     : if (ANY_EN)
            n_state = E2;
           else
            n_state = c_state;
  E2     : if (ANY_EN)
            n_state = E3;
           else
            n_state = c_state;
  E3     : if (ANY_EN)
            n_state = E4;
           else
            n_state = c_state;
  E4     : if (rst)
            n_state = IDLE;
           else
            n_state = c_state;
  default: if (rst)
            n_state = IDLE; 
           else
            n_state = c_state;  
  endcase
  end
  
  always@(posedge clk or posedge rst)begin
  if(rst)
      c_state <=  IDLE    ;
  else
      c_state <=  n_state ;
  end

  always@(*)begin
   case(c_state)
   IDLE   : SSG_D = 7'b1000000	; //0
   ST4    : SSG_D = 7'b0010000	; //9
   E4     : SSG_D = 7'b0000110	; //E
   default: SSG_D = 7'b1111111	; //NONE
   endcase
  end 
    
  assign SSG_EN  =   3'b111;   // disable the other three LEDs
 
endmodule