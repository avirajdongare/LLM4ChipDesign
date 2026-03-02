
`timescale 1ns/1ps
module full_addertb;
  reg a, b, cin;
  wire sum, cout;

  full_adder uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  integer errors = 0;
  reg exp_sum, exp_cout;
  reg [1:0] tmp;

  initial begin
    for (integer i = 0; i < 8; i = i + 1) begin
      {a,b,cin} = i[2:0];
      #1;
      tmp = a + b + cin;
      exp_sum  = tmp[0];
      exp_cout = tmp[1];
      if (sum !== exp_sum || cout !== exp_cout) begin
        $display("Error: a=%b b=%b cin=%b sum=%b cout=%b (exp sum=%b cout=%b)", a,b,cin,sum,cout,exp_sum,exp_cout);
        errors = errors + 1;
      end
    end

    if (errors == 0) $display("full_adder passed!");
    else            $display("full_adder failed!");
    $finish;
  end
endmodule
