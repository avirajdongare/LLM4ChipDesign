`timescale 1ns / 1ps

module adder4bit_tb;

    // Declare signals
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;

    // Instantiate the module under test
    adder4bit UUT (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Test patterns
    initial begin
        // Test case 1: Both inputs are 0
        a = 4'b0000;
        b = 4'b0000;
        #10;
        $display("Test case 1: a = %b, b = %b", a, b);

        // Test case 2: Both inputs are maximum (0xF)
        a = 4'b1111;
        b = 4'b1111;
        #10;
        $display("Test case 2: a = %b, b = %b", a, b);

        // Test case 3: One input is 0, the other is maximum (0xF)
        a = 4'b0000;
        b = 4'b1111;
        #10;
        $display("Test case 3: a = %b, b = %b", a, b);

        // Test case 4: One input is 0, the other is just below maximum (0xE)
        a = 4'b0000;
        b = 4'b1110;
        #10;
        $display("Test case 4: a = %b, b = %b", a, b);

        // Test case 5: One input is just below maximum (0xE), the other is just below maximum (0xE)
        a = 4'b1110;
        b = 4'b1110;
        #10;
        $display("Test case 5: a = %b, b = %b", a, b);

        // Test case 6: One input is just below maximum (0xE), the other is maximum (0xF)
        a = 4'b1110;
        b = 4'b1111;
        #10;
        $display("Test case 6: a = %b, b = %b", a, b);

        // Test case 7: Random inputs
        a = $random;
        b = $random;
        #10;
        $display("Test case 7: a = %b, b = %b", a, b);

        $finish;
    end

endmodule