
`timescale 1ns/1ps
module adder4tb;
  reg  [3:0] a, b;
  reg        cin;
  wire [3:0] sum;
  wire       cout;

  adder4 uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  integer errors = 0;
  reg [4:0] exp;

  initial begin
    // Exhaustive over a,b; both cin values
    for (integer ca = 0; ca < 16; ca = ca + 1) begin
      for (integer cb = 0; cb < 16; cb = cb + 1) begin
        for (integer cc = 0; cc < 2; cc = cc + 1) begin
          a = ca[3:0];
          b = cb[3:0];
          cin = cc[0];
          #1;
          exp = a + b + cin;
          if (sum !== exp[3:0] || cout !== exp[4]) begin
            $display("Error: a=%h b=%h cin=%b sum=%h cout=%b (exp sum=%h cout=%b)",
                     a,b,cin,sum,cout,exp[3:0],exp[4]);
            errors = errors + 1;
          end
        end
      end
    end

    if (errors == 0) $display("adder4 passed!");
    else            $display("adder4 failed!");
    $finish;
  end
endmodule
