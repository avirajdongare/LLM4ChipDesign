`timescale 1ns / 1ps

module mux2to1_tb;
    // Declare necessary signals
    reg a, b, sel;
    wire y;

    // Instantiate the module under test
    mux2to1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, a = 0, b = 0
        a = 1'b0;
        b = 1'b0;
        sel = 1'b0;
        #10;
        $display("Test case 1: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 2: sel = 0, a = 0, b = 1
        a = 1'b0;
        b = 1'b1;
        sel = 1'b0;
        #10;
        $display("Test case 2: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 3: sel = 0, a = 1, b = 0
        a = 1'b1;
        b = 1'b0;
        sel = 1'b0;
        #10;
        $display("Test case 3: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 4: sel = 0, a = 1, b = 1
        a = 1'b1;
        b = 1'b1;
        sel = 1'b0;
        #10;
        $display("Test case 4: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 5: sel = 1, a = 0, b = 0
        a = 1'b0;
        b = 1'b0;
        sel = 1'b1;
        #10;
        $display("Test case 5: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 6: sel = 1, a = 0, b = 1
        a = 1'b0;
        b = 1'b1;
        sel = 1'b1;
        #10;
        $display("Test case 6: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 7: sel = 1, a = 1, b = 0
        a = 1'b1;
        b = 1'b0;
        sel = 1'b1;
        #10;
        $display("Test case 7: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 8: sel = 1, a = 1, b = 1
        a = 1'b1;
        b = 1'b1;
        sel = 1'b1;
        #10;
        $display("Test case 8: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 9: Random values
        a = $random;
        b = $random;
        sel = $random;
        #10;
        $display("Test case 9: a = %b, b = %b, sel = %b", a, b, sel);

        // Test case 10: Random values
        a = $random;
        b = $random;
        sel = $random;
        #10;
        $display("Test case 10: a = %b, b = %b, sel = %b", a, b, sel);

        $finish;
    end
endmodule