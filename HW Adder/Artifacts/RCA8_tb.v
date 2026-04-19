`timescale 1ns/1ps

module RCA8_tb;
    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    
    // Outputs
    wire [7:0] sum;
    wire cout;
    
    // Internal signals for monitoring
    wire c1, c2, c3, c4, c5, c6, c7;
    
    // Test tracking
    integer passed;
    integer failed;
    integer test_num;
    
    // Expected values
    reg [8:0] expected_result;
    reg [7:0] expected_sum;
    reg expected_cout;
    reg expected_c1, expected_c2, expected_c3, expected_c4;
    reg expected_c5, expected_c6, expected_c7;
    
    // Instantiate the Unit Under Test (UUT)
    RCA8 uut (
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b)
    );
    
    // Access internal carry signals
    assign c1 = uut.c[1];
    assign c2 = uut.c[2];
    assign c3 = uut.c[3];
    assign c4 = uut.c[4];
    assign c5 = uut.c[5];
    assign c6 = uut.c[6];
    assign c7 = uut.c[7];
    
    // Task to calculate expected carry bits
    task calculate_expected_carries;
        input [7:0] op_a;
        input [7:0] op_b;
        output exp_c1, exp_c2, exp_c3, exp_c4, exp_c5, exp_c6, exp_c7;
        reg [1:0] temp;
        begin
            // Bit 0: cin = 0
            temp = op_a[0] + op_b[0];
            exp_c1 = temp[1];
            
            // Bit 1
            temp = op_a[1] + op_b[1] + exp_c1;
            exp_c2 = temp[1];
            
            // Bit 2
            temp = op_a[2] + op_b[2] + exp_c2;
            exp_c3 = temp[1];
            
            // Bit 3
            temp = op_a[3] + op_b[3] + exp_c3;
            exp_c4 = temp[1];
            
            // Bit 4
            temp = op_a[4] + op_b[4] + exp_c4;
            exp_c5 = temp[1];
            
            // Bit 5
            temp = op_a[5] + op_b[5] + exp_c5;
            exp_c6 = temp[1];
            
            // Bit 6
            temp = op_a[6] + op_b[6] + exp_c6;
            exp_c7 = temp[1];
        end
    endtask
    
    // Task to run a single test
    task run_test;
        input [7:0] test_a;
        input [7:0] test_b;
        begin
            a = test_a;
            b = test_b;
            #10;
            
            // Calculate expected values
            expected_result = test_a + test_b;
            expected_sum = expected_result[7:0];
            expected_cout = expected_result[8];
            
            calculate_expected_carries(test_a, test_b, 
                expected_c1, expected_c2, expected_c3, expected_c4,
                expected_c5, expected_c6, expected_c7);
            
            // Display test information
            $display("Test %0d: a=%b (%0d), b=%b (%0d)", test_num, a, a, b, b);
            $display("         sum=%b (%0d), cout=%b", sum, sum, cout);
            $display("         Internal carries: c[1]=%b, c[2]=%b, c[3]=%b, c[4]=%b, c[5]=%b, c[6]=%b, c[7]=%b",
                     c1, c2, c3, c4, c5, c6, c7);
            $display("         Expected: sum=%b (%0d), cout=%b", expected_sum, expected_sum, expected_cout);
            $display("         Expected carries: c[1]=%b, c[2]=%b, c[3]=%b, c[4]=%b, c[5]=%b, c[6]=%b, c[7]=%b",
                     expected_c1, expected_c2, expected_c3, expected_c4, expected_c5, expected_c6, expected_c7);
            
            // Check results
            if (sum === expected_sum && cout === expected_cout &&
                c1 === expected_c1 && c2 === expected_c2 && c3 === expected_c3 &&
                c4 === expected_c4 && c5 === expected_c5 && c6 === expected_c6 &&
                c7 === expected_c7) begin
                $display("         Result: PASS");
                passed = passed + 1;
            end else begin
                $display("         Result: FAIL");
                failed = failed + 1;
            end
            $display("");
            
            test_num = test_num + 1;
        end
    endtask
    
    initial begin
        // Initialize
        a = 0;
        b = 0;
        passed = 0;
        failed = 0;
        test_num = 1;
        
        $display("===========================================");
        $display("8-bit Ripple Carry Adder Testbench");
        $display("===========================================\n");
        
        // Test 1: All zeros
        run_test(8'b00000000, 8'b00000000);
        
        // Test 2: All ones (maximum overflow)
        run_test(8'b11111111, 8'b11111111);
        
        // Test 3: All ones + 1 (overflow case)
        run_test(8'b11111111, 8'b00000001);
        
        // Test 4: 1 + All ones (overflow case)
        run_test(8'b00000001, 8'b11111111);
        
        // Test 5: Maximum value + 0
        run_test(8'b11111111, 8'b00000000);
        
        // Test 6: 0 + Maximum value
        run_test(8'b00000000, 8'b11111111);
        
        // Test 7: Alternating bits (0xAA + 0x55 = 0xFF)
        run_test(8'b10101010, 8'b01010101);
        
        // Test 8: Alternating bits reversed
        run_test(8'b01010101, 8'b10101010);
        
        // Test 9: Half carry test (0x0F + 0x01 = 0x10)
        run_test(8'b00001111, 8'b00000001);
        
        // Test 10: Carry propagation through all bits (0x7F + 0x01 = 0x80)
        run_test(8'b01111111, 8'b00000001);
        
        // Test 11: Simple addition (1 + 1 = 2)
        run_test(8'b00000001, 8'b00000001);
        
        // Test 12: Power of 2 addition (128 + 128 = 256, overflow)
        run_test(8'b10000000, 8'b10000000);
        
        // Test 13: 64 + 64 = 128
        run_test(8'b01000000, 8'b01000000);
        
        // Test 14: Single bit set in each operand (different positions)
        run_test(8'b00010000, 8'b00000100);
        
        // Test 15: Consecutive numbers (100 + 55 = 155)
        run_test(8'b01100100, 8'b00110111);
        
        // Test 16: Near overflow (200 + 55 = 255)
        run_test(8'b11001000, 8'b00110111);
        
        // Test 17: Exact overflow boundary (200 + 56 = 256)
        run_test(8'b11001000, 8'b00111000);
        
        // Test 18: Only MSB set (128 + 0)
        run_test(8'b10000000, 8'b00000000);
        
        // Test 19: Only LSB set (1 + 0)
        run_test(8'b00000001, 8'b00000000);
        
        // Test 20: Checkerboard pattern with carry (0xCC + 0x44 = 0x110)
        run_test(8'b11001100, 8'b01000100);
        
        // Test 21: All carry bits should be 1 (0xFF + 0x01)
        run_test(8'b01111111, 8'b01111111);
        
        // Test 22: Random case (0x55 + 0x55 = 0xAA)
        run_test(8'b01010101, 8'b01010101);
        
        // Test 23: Large numbers (250 + 10 = 260, overflow)
        run_test(8'b11111010, 8'b00001010);
        
        // Test 24: Edge case (127 + 128 = 255, no overflow)
        run_test(8'b01111111, 8'b10000000);
        
        // Print final summary
        $display("===========================================");
        $display("TEST SUMMARY");
        $display("===========================================");
        $display("Total Tests: %0d", passed + failed);
        $display("Passed:      %0d", passed);
        $display("Failed:      %0d", failed);
        $display("===========================================");
        
        if (failed == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("SOME TESTS FAILED!");
        
        $finish;
    end
    
endmodule