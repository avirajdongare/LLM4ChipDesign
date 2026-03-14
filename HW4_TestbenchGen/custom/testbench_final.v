`timescale 1ns / 1ps

module priority_encoder4_tb;
    reg [3:0] req;
    wire [1:0] code;
    wire valid;

    integer passed_tests = 0;
    integer failed_tests = 0;

    priority_encoder4 uut (
        .req(req),
        .code(code),
        .valid(valid)
    );

    initial begin
        // Test case 1
        req = 4'b0000;
        #10;
        if (code == 2'd0 && valid == 1'b0) begin
            $display("Test case 1: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 1: req = %b, code = %b, valid = %b FAIL (expected: code = 0, valid = 0)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 2
        req = 4'b0001;
        #10;
        if (code == 2'd0 && valid == 1'b1) begin
            $display("Test case 2: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 2: req = %b, code = %b, valid = %b FAIL (expected: code = 0, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 3
        req = 4'b0010;
        #10;
        if (code == 2'd1 && valid == 1'b1) begin
            $display("Test case 3: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 3: req = %b, code = %b, valid = %b FAIL (expected: code = 1, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 4
        req = 4'b0100;
        #10;
        if (code == 2'd2 && valid == 1'b1) begin
            $display("Test case 4: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 4: req = %b, code = %b, valid = %b FAIL (expected: code = 2, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 5
        req = 4'b1000;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 5: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 5: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 6
        req = 4'b1011;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 6: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 6: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 7
        req = 4'b0111;
        #10;
        if (code == 2'd2 && valid == 1'b1) begin
            $display("Test case 7: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 7: req = %b, code = %b, valid = %b FAIL (expected: code = 2, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 8
        req = 4'b1100;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 8: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 8: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 9
        req = 4'b0101;
        #10;
        if (code == 2'd2 && valid == 1'b1) begin
            $display("Test case 9: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 9: req = %b, code = %b, valid = %b FAIL (expected: code = 2, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 10
        req = 4'b1010;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 10: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 10: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 11
        req = 4'b1110;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 11: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 11: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 12
        req = 4'b1111;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 12: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 12: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 13
        req = 4'b0011;
        #10;
        if (code == 2'd1 && valid == 1'b1) begin
            $display("Test case 13: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 13: req = %b, code = %b, valid = %b FAIL (expected: code = 1, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 14
        req = 4'b1001;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 14: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 14: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 15
        req = 4'b0110;
        #10;
        if (code == 2'd2 && valid == 1'b1) begin
            $display("Test case 15: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 15: req = %b, code = %b, valid = %b FAIL (expected: code = 2, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 16
        req = 4'b1101;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 16: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 16: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 17
        req = 4'b1111;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 17: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 17: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 18
        req = 4'b0000;
        #10;
        if (code == 2'd0 && valid == 1'b0) begin
            $display("Test case 18: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 18: req = %b, code = %b, valid = %b FAIL (expected: code = 0, valid = 0)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 19
        req = 4'b1111;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 19: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 19: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 20
        req = 4'b0000;
        #10;
        if (code == 2'd0 && valid == 1'b0) begin
            $display("Test case 20: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 20: req = %b, code = %b, valid = %b FAIL (expected: code = 0, valid = 0)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 21
        req = 4'b1010;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 21: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 21: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 22
        req = 4'b0101;
        #10;
        if (code == 2'd2 && valid == 1'b1) begin
            $display("Test case 22: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 22: req = %b, code = %b, valid = %b FAIL (expected: code = 2, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 23
        req = 4'b1100;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 23: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 23: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 24
        req = 4'b0011;
        #10;
        if (code == 2'd1 && valid == 1'b1) begin
            $display("Test case 24: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 24: req = %b, code = %b, valid = %b FAIL (expected: code = 1, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        // Test case 25
        req = 4'b1001;
        #10;
        if (code == 2'd3 && valid == 1'b1) begin
            $display("Test case 25: req = %b, code = %b, valid = %b PASS", req, code, valid);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test case 25: req = %b, code = %b, valid = %b FAIL (expected: code = 3, valid = 1)", req, code, valid);
            failed_tests = failed_tests + 1;
        end

        $display("\nTest Summary:");
        $display("Total tests run: %0d", passed_tests + failed_tests);
        $display("Passed: %0d", passed_tests);
        $display("Failed: %0d", failed_tests);
        $finish;
    end
endmodule
