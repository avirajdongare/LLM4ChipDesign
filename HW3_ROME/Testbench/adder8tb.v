
`timescale 1ns/1ps
module adder8tb;
  reg  [7:0] a, b;
  reg        cin;
  wire [7:0] sum;
  wire       cout;

  adder8 uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  integer errors = 0;
  reg [8:0] exp;

  initial begin
    // Randomized testing (fast) + some edge cases
    // Edge cases
    a = 8'h00; b = 8'h00; cin = 0; #1; exp = a + b + cin; if (sum !== exp[7:0] || cout !== exp[8]) errors++;
    a = 8'hFF; b = 8'h00; cin = 0; #1; exp = a + b + cin; if (sum !== exp[7:0] || cout !== exp[8]) errors++;
    a = 8'hFF; b = 8'h01; cin = 0; #1; exp = a + b + cin; if (sum !== exp[7:0] || cout !== exp[8]) errors++;
    a = 8'hAA; b = 8'h55; cin = 1; #1; exp = a + b + cin; if (sum !== exp[7:0] || cout !== exp[8]) errors++;

    // Random tests
    for (integer k = 0; k < 500; k = k + 1) begin
      a = $random;
      b = $random;
      cin = $random;
      #1;
      exp = a + b + cin;
      if (sum !== exp[7:0] || cout !== exp[8]) begin
        $display("Error: a=%h b=%h cin=%b sum=%h cout=%b (exp sum=%h cout=%b)",
                 a,b,cin,sum,cout,exp[7:0],exp[8]);
        errors = errors + 1;
      end
    end

    if (errors == 0) $display("adder8 passed!");
    else            $display("adder8 failed!");
    $finish;
  end
endmodule
