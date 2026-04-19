module adder8(output [7:0] sum, output cout, input [7:0] a, input [7:0] b);
  wire [7:0] p, g;
  wire c1, c2, c3, c4, c5, c6, c7;
  
  assign p = a ^ b;
  assign g = a & b;
  
  assign c1 = g[0];
  assign c2 = g[1] | g[0] & p[1];
  assign c3 = g[2] | g[1] & p[2] | g[0] & p[1] & p[2];
  assign c4 = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | g[0] & p[1] & p[2] & p[3];
  
  wire G03, P03;
  assign G03 = c4;
  assign P03 = p[0] & p[1] & p[2] & p[3];
  
  assign c5 = g[4] | G03 & p[4];
  assign c6 = g[5] | g[4] & p[5] | G03 & p[4] & p[5];
  assign c7 = g[6] | g[5] & p[6] | g[4] & p[5] & p[6] | G03 & p[4] & p[5] & p[6];
  assign cout = g[7] | g[6] & p[7] | g[5] & p[6] & p[7] | g[4] & p[5] & p[6] & p[7] | G03 & p[4] & p[5] & p[6] & p[7];
  
  assign sum[0] = p[0];
  assign sum[1] = p[1] ^ c1;
  assign sum[2] = p[2] ^ c2;
  assign sum[3] = p[3] ^ c3;
  assign sum[4] = p[4] ^ c4;
  assign sum[5] = p[5] ^ c5;
  assign sum[6] = p[6] ^ c6;
  assign sum[7] = p[7] ^ c7;
endmodule