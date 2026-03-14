
module sat_adder4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] sum
);

    wire [4:0] full_sum;
    assign full_sum = a + b;

    assign sum = (full_sum > 5'd15) ? 4'b1111 : full_sum[3:0];

endmodule
