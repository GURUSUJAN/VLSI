//DUT

module encoder(input[7:0]d,output reg [2:0]a);
  always@(*)
     begin
       casex(d)
         8'b00000001:a=3'b000;
         8'b0000001z:a=3'b001;
         8'b000001zz:a=3'b010;
         8'b00001zzz:a=3'b011;
         8'b0001zzzz:a=3'b100;
         8'b001zzzzz:a=3'b101;
         8'b01zzzzzz:a=3'b110;
         8'b1zzzzzzz:a=3'b111;
         //default:$display("Sorry Mate!");
       endcase
     end
endmodule

//TestBench
module hel;
  reg [7:0]d;
  wire [2:0]a;
  encoder x1(d,a);
  initial begin
    d=8'b00000100; #2;
    d=8'b00010000; #2;
    d=8'b00000011; #2;
    d=8'b10101010; #2;
  end
  initial begin
$monitor("Sim Time: %t",$time);
end
initial begin
$dumpfile("dump.vcd");
$dumpvars;
end
endmodule
