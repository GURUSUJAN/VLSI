//DUT
module FA(a,b,c,sum,carry);
  input a,b,c;
  output carry,sum;
  wire w1,w2,w3;
  HF h1(a,b,w1,w2);
  HF h2(w1,c,sum,w3);
  or(carry,w2,w3);
endmodule
module HF(a,b,s,c);
  input a,b;
  output s,c;
  assign s=a^b;
  assign c=a&b;
endmodule

//Test Bench
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
