module adder8 (
    output [7:0] sum,
    output cout,
    input [7:0] a,
    input [7:0] b
);
    wire [7:0] g, p;
    wire [7:0] c;
    
    // Generate and Propagate
    assign g = a & b;
    assign p = a ^ b;
    
    // Brent-Kung style prefix tree for carries
    // Level 1: pairs
    wire [3:0] g1, p1;
    assign g1[0] = g[1] | (p[1] & g[0]);
    assign p1[0] = p[1] & p[0];
    assign g1[1] = g[3] | (p[3] & g[2]);
    assign p1[1] = p[3] & p[2];
    assign g1[2] = g[5] | (p[5] & g[4]);
    assign p1[2] = p[5] & p[4];
    assign g1[3] = g[7] | (p[7] & g[6]);
    assign p1[3] = p[7] & p[6];
    
    // Level 2: quads
    wire [1:0] g2, p2;
    assign g2[0] = g1[1] | (p1[1] & g1[0]);
    assign p2[0] = p1[1] & p1[0];
    assign g2[1] = g1[3] | (p1[3] & g1[2]);
    assign p2[1] = p1[3] & p1[2];
    
    // Level 3: full 8-bit
    wire g3, p3;
    assign g3 = g2[1] | (p2[1] & g2[0]);
    
    // Compute carries (cin = 0, so c[0] = g[0])
    assign c[0] = g[0];
    assign c[1] = g1[0];
    assign c[2] = g[2] | (p[2] & g1[0]);
    assign c[3] = g2[0];
    assign c[4] = g1[2] | (p1[2] & g2[0]);
    assign c[5] = g1[2] | (p1[2] & g2[0]) | (p[5] & g[4]);
    wire g1_2_ext;
    assign g1_2_ext = g1[2] | (p1[2] & g2[0]);
    assign c[5] = g[5] | (p[5] & g1_2_ext);
    assign c[6] = g[6] | (p[6] & c[5]);
    assign c[7] = g3;
    
    // Sum computation
    assign sum[0] = p[0];
    assign sum[1] = p[1] ^ c[0];
    assign sum[2] = p[2] ^ c[1];
    assign sum[3] = p[3] ^ c[2];
    assign sum[4] = p[4] ^ c[3];
    assign sum[5] = p[5] ^ c[4];
    assign sum[6] = p[6] ^ c[5];
    assign sum[7] = p[7] ^ c[6];
    
    assign cout = c[7];

endmodule