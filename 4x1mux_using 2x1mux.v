//DUT
module mux4x1(a,b,c,d,s0,s1,out);
  input a,b,c,d,s0,s1;
  output out;
  mux2x1 m1(a,b,s0,w1);
  mux2x1 m2(c,d,s0,w2);
  mux2x1 m3(w1,w2,s1,out);
endmodule
module mux2x1(a,b,s00,out1);
  input a,b,s00;
  output out1;
  wire s0bar;
  not(s0bar,s00);
  assign out1=(s0bar&a)|(s00&b);
endmodule

//Test Bench
module mux_tb;
  reg a,b,c,d,s0,s1;
  wire out;
  mux4x1 x1(a,b,c,d,s0,s1,out);
  initial begin
    a=1;b=0;c=1;d=1;s0=0;s1=1; #2;
    a=0;b=1;c=1;d=0;s0=0;s1=1; #2;
    a=0;b=0;c=1;d=0;s0=1;s1=0; #2;
    a=0;b=0;c=0;d=1;s0=1;s1=1; #2;
    a=1;b=0;c=0;d=0;s0=0;s1=0; #2;
  end
  initial begin
    $monitor("Sim Time: %t",$time);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
