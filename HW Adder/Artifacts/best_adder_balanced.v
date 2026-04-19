module adder8(output [7:0] sum, output cout, input [7:0] a, input [7:0] b);
  wire [7:0] p = a ^ b;
  wire [7:0] k = ~(a | b);
  
  wire c1, c2, c3, c4, c5, c6, c7;
  
  assign c1 = ~k[0] & ~p[0];
  assign c2 = ~k[1] & (~p[1] | c1);
  assign c3 = ~k[2] & (~p[2] | c2);
  assign c4 = ~k[3] & (~p[3] | c3);
  assign c5 = ~k[4] & (~p[4] | c4);
  assign c6 = ~k[5] & (~p[5] | c5);
  assign c7 = ~k[6] & (~p[6] | c6);
  assign cout = ~k[7] & (~p[7] | c7);
  
  assign sum[0] = p[0];
  assign sum[1] = p[1] ^ c1;
  assign sum[2] = p[2] ^ c2;
  assign sum[3] = p[3] ^ c3;
  assign sum[4] = p[4] ^ c4;
  assign sum[5] = p[5] ^ c5;
  assign sum[6] = p[6] ^ c6;
  assign sum[7] = p[7] ^ c7;
endmodule