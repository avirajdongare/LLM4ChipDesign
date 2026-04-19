module adder8(output [7:0] sum, output cout, input [7:0] a, input [7:0] b);
  wire [8:0] result;
  assign result = a + b;
  assign sum = result[7:0];
  assign cout = result[8];
endmodule