// Generated from BENCH
module decoder_4x16_part4(
    A0, A1, A2, A3, Y0, Y1, Y10, Y11, Y12, Y13, Y14, Y15, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9
);

  input  A0, A1, A2, A3;
  output Y0, Y1, Y10, Y11, Y12, Y13, Y14, Y15, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9;
  wire   n_A0, n_A1, n_A2, n_A3, p_Y0_0, p_Y10_0, p_Y11_0, p_Y12_0, p_Y13_0, p_Y14_0, p_Y15_0, p_Y1_0, p_Y2_0, p_Y3_0, p_Y4_0, p_Y5_0, p_Y6_0, p_Y7_0, p_Y8_0, p_Y9_0;

  assign Y0 = p_Y0_0;
  assign Y1 = p_Y1_0;
  assign Y10 = p_Y10_0;
  assign Y11 = p_Y11_0;
  assign Y12 = p_Y12_0;
  assign Y13 = p_Y13_0;
  assign Y14 = p_Y14_0;
  assign Y15 = p_Y15_0;
  assign Y2 = p_Y2_0;
  assign Y3 = p_Y3_0;
  assign Y4 = p_Y4_0;
  assign Y5 = p_Y5_0;
  assign Y6 = p_Y6_0;
  assign Y7 = p_Y7_0;
  assign Y8 = p_Y8_0;
  assign Y9 = p_Y9_0;
  assign n_A0 = ~(A0);
  assign n_A1 = ~(A1);
  assign n_A2 = ~(A2);
  assign n_A3 = ~(A3);
  assign p_Y0_0 = (n_A0 & n_A1 & n_A2 & n_A3);
  assign p_Y10_0 = (n_A0 & A1 & n_A2 & A3);
  assign p_Y11_0 = (A0 & A1 & n_A2 & A3);
  assign p_Y12_0 = (n_A0 & n_A1 & A2 & A3);
  assign p_Y13_0 = (A0 & n_A1 & A2 & A3);
  assign p_Y14_0 = (n_A0 & A1 & A2 & A3);
  assign p_Y15_0 = (A0 & A1 & A2 & A3);
  assign p_Y1_0 = (A0 & n_A1 & n_A2 & n_A3);
  assign p_Y2_0 = (n_A0 & A1 & n_A2 & n_A3);
  assign p_Y3_0 = (A0 & A1 & n_A2 & n_A3);
  assign p_Y4_0 = (n_A0 & n_A1 & A2 & n_A3);
  assign p_Y5_0 = (A0 & n_A1 & A2 & n_A3);
  assign p_Y6_0 = (n_A0 & A1 & A2 & n_A3);
  assign p_Y7_0 = (A0 & A1 & A2 & n_A3);
  assign p_Y8_0 = (n_A0 & n_A1 & n_A2 & A3);
  assign p_Y9_0 = (A0 & n_A1 & n_A2 & A3);

endmodule