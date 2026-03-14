`timescale 1ns / 1ps

module priority_encoder4_tb;

    // Declare signals
    reg [3:0] req;
    wire [1:0] code;
    wire valid;

    // Instantiate the module under test
    priority_encoder4 uut (
        .req(req),
        .code(code),
        .valid(valid)
    );

    initial begin
        // Test case 1: All request bits are 0
        req = 4'b0000;
        #10 $display("Test case 1: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 2: Only the least significant bit is asserted
        req = 4'b0001;
        #10 $display("Test case 2: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 3: Only the second least significant bit is asserted
        req = 4'b0010;
        #10 $display("Test case 3: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 4: Only the third least significant bit is asserted
        req = 4'b0100;
        #10 $display("Test case 4: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 5: Only the most significant bit is asserted
        req = 4'b1000;
        #10 $display("Test case 5: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 6: Multiple bits are asserted, with the highest priority bit asserted
        req = 4'b1011;
        #10 $display("Test case 6: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 7: Multiple bits are asserted, with the highest priority bit not asserted
        req = 4'b0111;
        #10 $display("Test case 7: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 8: Random test case
        req = $random;
        #10 $display("Test case 8: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 9: Random test case
        req = $random;
        #10 $display("Test case 9: req = %b, code = %b, valid = %b", req, code, valid);

        // Test case 10: Random test case
        req = $random;
        #10 $display("Test case 10: req = %b, code = %b, valid = %b", req, code, valid);

        $finish;
    end

endmodule