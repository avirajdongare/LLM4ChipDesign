// Generated from BENCH
module decoder_3x8_sonnet(
    A0, A1, A2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);

  input  A0, A1, A2;
  output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
  wire   n_A0, n_A1, n_A2, p_Y0_0, p_Y0_1, p_Y0_2, p_Y1_0, p_Y1_1, p_Y1_2, p_Y2_0, p_Y2_1, p_Y2_2, p_Y3_0, p_Y3_1, p_Y3_2, p_Y4_0, p_Y4_1, p_Y4_2, p_Y5_0, p_Y5_1, p_Y5_2, p_Y6_0, p_Y6_1, p_Y6_2, p_Y7_0, p_Y7_1, p_Y7_2;

  assign Y0 = (p_Y0_0 | p_Y0_1 | p_Y0_2);
  assign Y1 = (p_Y1_0 | p_Y1_1 | p_Y1_2);
  assign Y2 = (p_Y2_0 | p_Y2_1 | p_Y2_2);
  assign Y3 = (p_Y3_0 | p_Y3_1 | p_Y3_2);
  assign Y4 = (p_Y4_0 | p_Y4_1 | p_Y4_2);
  assign Y5 = (p_Y5_0 | p_Y5_1 | p_Y5_2);
  assign Y6 = (p_Y6_0 | p_Y6_1 | p_Y6_2);
  assign Y7 = (p_Y7_0 | p_Y7_1 | p_Y7_2);
  assign n_A0 = ~(A0);
  assign n_A1 = ~(A1);
  assign n_A2 = ~(A2);
  assign p_Y0_0 = (n_A0 & n_A1 & A2);
  assign p_Y0_1 = (n_A0 & A1 & n_A2);
  assign p_Y0_2 = (A0 & n_A1 & n_A2);
  assign p_Y1_0 = (n_A0 & n_A1 & n_A2);
  assign p_Y1_1 = (A0 & n_A1 & A2);
  assign p_Y1_2 = (A0 & A1 & n_A2);
  assign p_Y2_0 = (n_A0 & n_A1 & n_A2);
  assign p_Y2_1 = (n_A0 & A1 & A2);
  assign p_Y2_2 = (A0 & A1 & n_A2);
  assign p_Y3_0 = (n_A0 & A1 & n_A2);
  assign p_Y3_1 = (A0 & n_A1 & n_A2);
  assign p_Y3_2 = (A0 & A1 & A2);
  assign p_Y4_0 = (n_A0 & n_A1 & n_A2);
  assign p_Y4_1 = (n_A0 & A1 & A2);
  assign p_Y4_2 = (A0 & n_A1 & A2);
  assign p_Y5_0 = (n_A0 & n_A1 & A2);
  assign p_Y5_1 = (A0 & n_A1 & n_A2);
  assign p_Y5_2 = (A0 & A1 & A2);
  assign p_Y6_0 = (n_A0 & n_A1 & A2);
  assign p_Y6_1 = (n_A0 & A1 & n_A2);
  assign p_Y6_2 = (A0 & A1 & A2);
  assign p_Y7_0 = (n_A0 & A1 & A2);
  assign p_Y7_1 = (A0 & n_A1 & A2);
  assign p_Y7_2 = (A0 & A1 & n_A2);

endmodule