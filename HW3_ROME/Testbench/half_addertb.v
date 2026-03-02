
`timescale 1ns/1ps
module half_addertb;
  reg a, b;
  wire sum, carry;

  half_adder uut(.a(a), .b(b), .sum(sum), .carry(carry));

  integer errors = 0;
  reg exp_sum, exp_carry;

  initial begin
    for (integer i = 0; i < 4; i = i + 1) begin
      {a,b} = i[1:0];
      #1;
      exp_sum   = a ^ b;
      exp_carry = a & b;
      if (sum !== exp_sum || carry !== exp_carry) begin
        $display("Error: a=%b b=%b sum=%b carry=%b (exp sum=%b carry=%b)", a,b,sum,carry,exp_sum,exp_carry);
        errors = errors + 1;
      end
    end

    if (errors == 0) $display("half_adder passed!");
    else            $display("half_adder failed!");
    $finish;
  end
endmodule
