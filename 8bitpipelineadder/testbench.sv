// Code your testbench here
// or browse Examples
module test_eightbitadder();
  reg[7:0] a,b;
  reg c_in;
  reg clk;
  wire [7:0] sum;
  wire cout;
 
  
  eightbit_adder add2(a,b,c_in,sum,clk,cout);
  initial begin
    a=4'd1;b=4'd2;c_in=1'b1;
   #10;
  a=4'd3;b=4'd4;c_in=1'b0;
  #10;
  a=4'd5;b=4'd6;c_in=1'b1;
  #10;
    a=4'd6;b=4'd3;c_in=1'b0;
    #10;
     a=4'd8;b=4'd7;c_in=1'b1;
  end
  initial begin
    clk=0;
  end
  always
    begin
      #10clk=~clk;
    end
  initial begin
    #80;
  $finish;
  end
  initial begin
    $monitor("clk=%b, A=%b, B=%b,C=%b,S=%b,Cout=%b",clk,a,b,c_in,sum,cout);
  end
endmodule