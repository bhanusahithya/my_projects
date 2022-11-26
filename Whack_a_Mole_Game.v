`timescale 1ns / 1ps
module Whack_a_Mole_Game( //score count module
input clk, //system clock 100 MHz
input [15:0] sw, //switches used to whack a mole
input reset,//reset or to restart the game at any point
output reg [15:0] led, //leds as mole
output reg [5:0]score_count); //maximum cmole count 32

localparam 
S000000 = 0, //constant declared for each state, for maximum score count of 32
S000001 = 1, 
S000010 = 2, //
S000011 = 3,
S000100 = 4,
S000101 = 5,
S000110 = 6,
S000111 = 7,
S001000 = 8,
S001001 = 9,
S001010 = 10,
S001011 = 11,
S001100 = 12,
S001101 = 13,
S001110 = 14,
S001111 = 15,
S010000 = 16,
S010001 = 17,
S010010 = 18,
S010011 = 19,
S010100 = 20;
 reg [5:0] current_state = 0; // Current score count state declared as register
 reg [5:0] next_state = 0; // Next score count state declared as register

//Reset/Restart the game
 always @(posedge clk) begin
 if (reset) 
    current_state <= S000000;
else 
    current_state <= next_state;
 end
 
 
 always @(posedge clk) begin
 
 end

// Next state combinational logic

 always @(current_state, sw[15:0])
 begin
 case(current_state)
 
S000000: begin //initially score count is set to 1
next_state <= S000000;
led[15:0] <= 0;  //All leds initially zero
score_count <= 6'b000000; //score count is zero
 led[6] <= 1; //led 1 is set on that reprsents a mole
 if (sw[6]) //if the user flips sw[1]
        next_state <= S000001; //then score count goes to 1, and next state is S0000001
    else
        next_state <= S000000;
end

S000001: begin //if the score count is 1
score_count <= 6'b000001;
    led[15:0] <= 0;
 led[3] <= 1; // and led 11 is on
 if (sw[3]) //and if sw11 is flipped, a mole is whacked
        next_state <= S000010; //then score count goes up by 1 i.e. in this case it oes to 2
    else
        next_state <= S000001;
end


S000010: begin
score_count <= 6'b000010;//2
    led[15:0] <= 0;
 led[1] <= 1;
 if (sw[1])
        next_state <= S000011; //3 in dec
    else
        next_state <= S000010;
end
 
S000011: begin 
score_count <= 6'b000011;
    led[15:0] <= 0;
 led[14] <= 1;
 if (sw[14)
        next_state <= S000100; 
    else
        next_state <= S000011;
end

S000100: begin
score_count <= 6'b0000100;
    led[15:0] <= 0;
 led[6] <= 1;
 if (sw[6])
        next_state <= S000101; 
    else
        next_state <= S000100;
end

S000101: begin
score_count <= 6'b0000101;
    led[15:0] <= 0;
 led[8] <= 1;
 if (sw[8])
        next_state <= S000110; 
    else
        next_state <= S000101;
end



S000110: begin
score_count <= 6;
    led[15:0] <= 0;
    led[9] <= 1;
    if (sw[9])
        next_state <= S000111; 
    else
        next_state <= S000110;
end

S000111: begin
score_count <= 7;
    led[15:0] <= 0;
    led[14] <= 1;
    if (sw[14])
        next_state <= S001000; 
    else
        next_state <= S000111;
end

S001000: begin
score_count <= 8;
    led[15:0] <= 0;
    led[15] <= 1;
    if (sw[15])
        next_state <= S001001; //go on to next state
    else
        next_state <= S001000;
end

S001001: begin
score_count <= 9;
    led[15:0] <= 0;
    led[8] <= 1;
    if (sw[8])
        next_state <= S001010; //go on to next state
    else
        next_state <= S001001;
end

S001010: begin
score_count <= 10;
    led[15:0] <= 0;
    led[5] <= 1;
    if (sw[5])
        next_state <= S001011; //go on to next state
    else
        next_state <= S001010;
end

S001011: begin
score_count <= 11;
    led[15:0] <= 0;
    led[13] <= 1;
    if (sw[13])
        next_state <= S001100; //go on to next state
    else
        next_state <= S001011;
end

S001100: begin
score_count <= 12;
    led[15:0] <= 0;
    led[4] <= 1;
    if (sw[4])
        next_state <= S001101; //go on to next state
    else
        next_state <= S001100;
end

S001101: begin
score_count <= 13;
    led[15:0] <= 0;
    led[10] <= 1;
    if (sw[10])
        next_state <= S001110; 
    else
        next_state <= S001101;
end

S001110: begin
score_count <= 14;
    led[15:0] <= 0;
    led[0] <= 1;
    if (sw[0])
        next_state <= S001111; 
    else
        next_state <= S001110;
end

S001111: begin
score_count <= 15;
    led[15:0] <= 0;
    led[3] <= 1;
    if (sw[3])
        next_state <= S010000; 
    else
        next_state <= S001111;
end

//Turnaround point

S010000: begin
score_count <= 16;
    led[15:0] <= 0;
    led[10] <= 1;
    if (sw[10] == 0)
        next_state <= S010001;
    else
        next_state <= S010000;
end


S010001: begin
score_count <= 17;
    led[15:0] <= 0;
    led[7] <= 1;
    if (sw[7] ==  0)
        next_state <= S010010; 
    else
        next_state <= S010001;
end

S010010: begin
score_count <= 18;
    led[15:0] <= 0;
    led[11] <= 1;
    if (sw[11] ==  0)
        next_state <= S010011; 
    else
        next_state <= S010010;
end

S010011: begin
score_count <= 19;
    led[15:0] <= 0;
    led[15] <= 1;
    if (sw[15] ==  0)
        next_state <= S010100; 
    else
        next_state <= S010011;
end

S010100: begin
 next_state <=S010100
score_count <= 20;
    led[15:0] <= 0;
    
end

default: begin 
    next_state = S000000;
end

endcase
end

 
endmodule


