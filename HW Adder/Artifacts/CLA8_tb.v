`timescale 1ns/1ps

module CLA8_tb;
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] sum;
    wire cout;
    wire [7:0] g_mon;
    wire [7:0] p_mon;
    wire [7:0] c_mon;
    wire [35:0] e_mon;
    integer passed, failed, test_num;
    reg [8:0] expected_result;
    reg [7:0] expected_sum, expected_g, expected_p, expected_c;
    reg expected_cout;
    reg [35:0] expected_e;

    CLA8 uut (.sum(sum), .cout(cout), .a(a), .b(b));
    assign g_mon = uut.g;
    assign p_mon = uut.p;
    assign c_mon = uut.c;
    assign e_mon = uut.e;

    task compute_expected;
        input [7:0] a_in, b_in;
        integer i; reg cin_val;
        begin
            cin_val = 1'b0;
            for (i = 0; i < 8; i = i + 1) begin
                expected_g[i] = a_in[i] & b_in[i];
                expected_p[i] = a_in[i] ^ b_in[i];
            end
            expected_e[0]=cin_val&expected_p[0]; expected_c[0]=expected_e[0]|expected_g[0];
            expected_e[1]=cin_val&expected_p[0]&expected_p[1];
            expected_e[2]=expected_g[0]&expected_p[1];
            expected_c[1]=expected_e[1]|expected_e[2]|expected_g[1];
            expected_e[3]=cin_val&expected_p[0]&expected_p[1]&expected_p[2];
            expected_e[4]=expected_g[0]&expected_p[1]&expected_p[2];
            expected_e[5]=expected_g[1]&expected_p[2];
            expected_c[2]=expected_e[3]|expected_e[4]|expected_e[5]|expected_g[2];
            expected_e[6]=cin_val&expected_p[0]&expected_p[1]&expected_p[2]&expected_p[3];
            expected_e[7]=expected_g[0]&expected_p[1]&expected_p[2]&expected_p[3];
            expected_e[8]=expected_g[1]&expected_p[2]&expected_p[3];
            expected_e[9]=expected_g[2]&expected_p[3];
            expected_c[3]=expected_e[6]|expected_e[7]|expected_e[8]|expected_e[9]|expected_g[3];
            expected_e[10]=cin_val&expected_p[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4];
            expected_e[11]=expected_g[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4];
            expected_e[12]=expected_g[1]&expected_p[2]&expected_p[3]&expected_p[4];
            expected_e[13]=expected_g[2]&expected_p[3]&expected_p[4];
            expected_e[14]=expected_g[3]&expected_p[4];
            expected_c[4]=expected_e[10]|expected_e[11]|expected_e[12]|expected_e[13]|expected_e[14]|expected_g[4];
            expected_e[15]=cin_val&expected_p[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5];
            expected_e[16]=expected_g[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5];
            expected_e[17]=expected_g[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5];
            expected_e[18]=expected_g[2]&expected_p[3]&expected_p[4]&expected_p[5];
            expected_e[19]=expected_g[3]&expected_p[4]&expected_p[5];
            expected_e[20]=expected_g[4]&expected_p[5];
            expected_c[5]=expected_e[15]|expected_e[16]|expected_e[17]|expected_e[18]|expected_e[19]|expected_e[20]|expected_g[5];
            expected_e[21]=cin_val&expected_p[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6];
            expected_e[22]=expected_g[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6];
            expected_e[23]=expected_g[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6];
            expected_e[24]=expected_g[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6];
            expected_e[25]=expected_g[3]&expected_p[4]&expected_p[5]&expected_p[6];
            expected_e[26]=expected_g[4]&expected_p[5]&expected_p[6];
            expected_e[27]=expected_g[5]&expected_p[6];
            expected_c[6]=expected_e[21]|expected_e[22]|expected_e[23]|expected_e[24]|expected_e[25]|expected_e[26]|expected_e[27]|expected_g[6];
            expected_e[28]=cin_val&expected_p[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6]&expected_p[7];
            expected_e[29]=expected_g[0]&expected_p[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6]&expected_p[7];
            expected_e[30]=expected_g[1]&expected_p[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6]&expected_p[7];
            expected_e[31]=expected_g[2]&expected_p[3]&expected_p[4]&expected_p[5]&expected_p[6]&expected_p[7];
            expected_e[32]=expected_g[3]&expected_p[4]&expected_p[5]&expected_p[6]&expected_p[7];
            expected_e[33]=expected_g[4]&expected_p[5]&expected_p[6]&expected_p[7];
            expected_e[34]=expected_g[5]&expected_p[6]&expected_p[7];
            expected_e[35]=expected_g[6]&expected_p[7];
            expected_c[7]=expected_e[28]|expected_e[29]|expected_e[30]|expected_e[31]|expected_e[32]|expected_e[33]|expected_e[34]|expected_e[35]|expected_g[7];
            expected_result = a_in + b_in;
            expected_sum = expected_result[7:0];
            expected_cout = expected_result[8];
        end
    endtask

    task run_test;
        input [7:0] a_val, b_val;
        reg test_pass;
        begin
            a = a_val; b = b_val; #10;
            compute_expected(a_val, b_val);
            test_pass = (sum===expected_sum) && (cout===expected_cout) &&
                        (g_mon===expected_g) && (p_mon===expected_p) &&
                        (c_mon===expected_c) && (e_mon===expected_e);
            $display("Test %0d: a=%b b=%b | sum=%b cout=%b | g=%b p=%b c=%b",
                     test_num, a, b, sum, cout, g_mon, p_mon, c_mon);
            if (test_pass) begin
                $display("Result: PASS"); passed = passed + 1;
            end else begin
                $display("Result: FAIL");
                if (sum !== expected_sum)   $display("  -> sum mismatch! got=%b exp=%b", sum, expected_sum);
                if (cout !== expected_cout) $display("  -> cout mismatch!");
                if (c_mon !== expected_c)   $display("  -> c mismatch! got=%b exp=%b", c_mon, expected_c);
                if (e_mon !== expected_e)   $display("  -> e mismatch!");
                failed = failed + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    initial begin
        passed=0; failed=0; test_num=1;
        $display("=== CLA8 Testbench ===");
        run_test(8'h00, 8'h00);
        run_test(8'hFF, 8'hFF);
        run_test(8'hFF, 8'h01);
        run_test(8'h01, 8'hFF);
        run_test(8'hAA, 8'h55);
        run_test(8'h55, 8'hAA);
        run_test(8'h0F, 8'h01);
        run_test(8'h7F, 8'h01);
        run_test(8'h80, 8'h80);
        run_test(8'h40, 8'h40);
        run_test(8'h01, 8'h01);
        run_test(8'hF0, 8'h0F);
        run_test(8'h64, 8'h37);
        run_test(8'hC8, 8'h37);
        run_test(8'hC8, 8'h38);
        run_test(8'h7F, 8'h7F);
        run_test(8'h55, 8'h55);
        run_test(8'hFA, 8'h0A);
        run_test(8'h7F, 8'h80);
        run_test(8'hCC, 8'h44);
        run_test(8'h10, 8'h04);
        run_test(8'hA5, 8'h5A);
        run_test(8'h12, 8'h34);
        run_test(8'hFE, 8'h02);
        $display("====================");
        $display("Total: %0d Passed: %0d Failed: %0d", passed+failed, passed, failed);
        if (failed==0) $display("ALL TESTS PASSED!");
        else $display("SOME TESTS FAILED!");
        $finish;
    end
endmodule
