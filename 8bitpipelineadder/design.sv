// Code your design here
module onebitadder(A,B,c,s,cout);
  input A,B,c;
  output s,cout;
  assign s= A^B^c;
  assign cout= (A&B)|((A^B)&c);
endmodule

//fourbitadder
module fourbit_adder(A,B, cin, sum,Cout);
  input logic[3:0]A,B;
  input logic cin;
  output logic [3:0]sum;
  output bit Cout;
  wire [3:0] carry;
  onebitadder one1(A[0],B[0],cin,sum[0],carry[0]);
  onebitadder one2(A[1],B[1],carry[0],sum[1],carry[1]);
  onebitadder one3(A[2],B[2],carry[1],sum[2],carry[2]);
  onebitadder one4(A[3],B[3],carry[2],sum[3],carry[3]);
  assign Cout=carry[3];
endmodule
//flip flop
module dflipflop(input d, input clk,output reg q);
  always@(posedge clk)
    begin
      q<=d;
    end
endmodule
//four bit register

module fourbit_register(D,clk,Q);
  input [3:0]D;
  input clk;
  output reg [3:0]Q;
  dflipflop f1(D[0],clk,Q[0]);
  dflipflop f2(D[1],clk,Q[1]);
  dflipflop f3(D[2],clk,Q[2]);
  dflipflop f4(D[3],clk,Q[3]);
endmodule

//8bitpipelinedadder

module eightbit_adder(A,B,cin,SUM,clk,COUT);
  input [7:0]A,B;
  input cin;
  input clk;
  output logic [7:0]SUM;
  output bit COUT;
  wire [3:0] sum1;
  wire [3:0]a,b;
  wire carry1,carry2;
  fourbit_adder c1(A[3:0], B[3:0],cin,sum1,carry1);
  dflipflop d1(carry1,clk,carry2);
  fourbit_register e1(sum1,clk,SUM[3:0]);
  fourbit_register e2(A[7:4],clk,a);
  fourbit_register e3(B[7:4],clk,b);
  fourbit_adder c2(a,b,carry2,SUM[7:4],COUT);
endmodule
 
  
  