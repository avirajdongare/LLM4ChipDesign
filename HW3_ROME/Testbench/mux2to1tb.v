
`timescale 1ns/1ps
module mux2to1tb;

  reg in1, in2, select;
  wire out;

  mux2to1 uut (
    .in1(in1),
    .in2(in2),
    .select(select),
    .out(out)
  );

  integer errors = 0;

  initial begin
    for (integer i = 0; i < 8; i = i + 1) begin
      {in1, in2, select} = i;
      #1;
      if (out !== (select ? in2 : in1)) begin
        $display("Error: in1=%b in2=%b sel=%b out=%b", in1, in2, select, out);
        errors = errors + 1;
      end
    end

    if (errors == 0)
      $display("mux2to1 passed!");
    else
      $display("mux2to1 failed!");

    $finish;
  end
endmodule
