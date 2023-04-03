//DUT
// Code your design here
module FA(a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  wire w1,w2,w3;
  xor(sum,a,b,c);
  and(w1,a,b);
  and(w2,b,c);
  and(w3,c,a);
  or(carry,w1,w2,w3);
endmodule

//Test Bench
// Code your testbench here
// or browse Examples
module FA_TB;
  reg a,b,c;
  wire sum,carry;
  FA x1(a,b,c,sum,carry);
  initial
    begin
      a=0;b=0;c=0; #2;
      a=0;b=0;c=1; #2;
      a=0;b=1;c=0; #2;
      a=0;b=1;c=1; #2;
      a=1;b=0;c=0; #2;
      a=1;b=0;c=1; #2;
      a=1;b=1;c=0; #2;
      a=1;b=1;c=1; #2;
      
    end
  initial begin
    $monitor("Sim Time: %t",$time);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
