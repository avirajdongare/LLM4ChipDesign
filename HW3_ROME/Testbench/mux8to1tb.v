
`timescale 1ns/1ps
module mux8to1tb;

  reg [7:0] in;
  reg [2:0] sel;
  wire out;

  mux8to1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  integer errors = 0;

  initial begin
    for (integer i = 0; i < 256; i = i + 1) begin
      in = i;
      for (integer j = 0; j < 8; j = j + 1) begin
        sel = j;
        #1;
        if (out !== in[sel]) begin
          $display("Error: in=%b sel=%b out=%b", in, sel, out);
          errors = errors + 1;
        end
      end
    end

    if (errors == 0)
      $display("mux8to1 passed!");
    else
      $display("mux8to1 failed!");

    $finish;
  end
endmodule
