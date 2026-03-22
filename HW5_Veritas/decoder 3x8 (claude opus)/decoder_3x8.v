// Generated from BENCH
module decoder_3x8(
    A0, A1, A2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);

  input  A0, A1, A2;
  output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
  wire   n_A0, n_A1, n_A2, p_Y0_0, p_Y1_0, p_Y2_0, p_Y3_0, p_Y4_0, p_Y5_0, p_Y6_0, p_Y7_0;

  assign Y0 = p_Y0_0;
  assign Y1 = p_Y1_0;
  assign Y2 = p_Y2_0;
  assign Y3 = p_Y3_0;
  assign Y4 = p_Y4_0;
  assign Y5 = p_Y5_0;
  assign Y6 = p_Y6_0;
  assign Y7 = p_Y7_0;
  assign n_A0 = ~(A0);
  assign n_A1 = ~(A1);
  assign n_A2 = ~(A2);
  assign p_Y0_0 = (n_A0 & n_A1 & n_A2);
  assign p_Y1_0 = (A0 & n_A1 & n_A2);
  assign p_Y2_0 = (n_A0 & A1 & n_A2);
  assign p_Y3_0 = (A0 & A1 & n_A2);
  assign p_Y4_0 = (n_A0 & n_A1 & A2);
  assign p_Y5_0 = (A0 & n_A1 & A2);
  assign p_Y6_0 = (n_A0 & A1 & A2);
  assign p_Y7_0 = (A0 & A1 & A2);

endmodule
