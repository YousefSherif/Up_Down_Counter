/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Sep 14 17:28:04 2022
/////////////////////////////////////////////////////////////


module Up_Down_Counter ( i_clk, i_rst_n, i_in, i_load, i_up, i_down, o_counter, 
        o_high, o_low );
  input [4:0] i_in;
  output [4:0] o_counter;
  input i_clk, i_rst_n, i_load, i_up, i_down;
  output o_high, o_low;
  wire   n41, n42, n43, n44, N8, N9, N10, N11, N14, N15, N16, N17, N31, n4, n5,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n34, n35, n36, n37, n38, n39;
  wire   [4:2] \add_29/carry ;
  assign o_high = N31;

  AOI2BB1X8M U16 ( .A0N(N31), .A1N(n39), .B0(n34), .Y(n9) );
  AND4X8M U19 ( .A(o_counter[4]), .B(o_counter[3]), .C(n18), .D(o_counter[2]), 
        .Y(N31) );
  DFFRQX1M \o_counter_reg[4]  ( .D(n22), .CK(i_clk), .RN(n26), .Q(n41) );
  DFFRQX1M \o_counter_reg[3]  ( .D(n21), .CK(i_clk), .RN(n26), .Q(n42) );
  DFFRX1M \o_counter_reg[0]  ( .D(n23), .CK(i_clk), .RN(n26), .Q(n44), .QN(n5)
         );
  DFFRX1M \o_counter_reg[2]  ( .D(n20), .CK(i_clk), .RN(n26), .Q(n43), .QN(n24) );
  DFFRX2M \o_counter_reg[1]  ( .D(n19), .CK(i_clk), .RN(n26), .QN(n4) );
  INVXLM U25 ( .A(i_rst_n), .Y(n25) );
  INVX4M U26 ( .A(n25), .Y(n26) );
  INVX2M U27 ( .A(n44), .Y(n27) );
  INVX2M U28 ( .A(n43), .Y(n28) );
  CLKINVX12M U29 ( .A(n4), .Y(o_counter[1]) );
  NOR2X4M U30 ( .A(o_counter[1]), .B(o_counter[0]), .Y(n35) );
  CLKINVX12M U31 ( .A(n28), .Y(o_counter[2]) );
  BUFX10M U32 ( .A(n41), .Y(o_counter[4]) );
  XOR2X1M U33 ( .A(o_counter[4]), .B(n37), .Y(N17) );
  CLKBUFX12M U34 ( .A(n42), .Y(o_counter[3]) );
  BUFX10M U35 ( .A(n44), .Y(o_counter[0]) );
  NOR2X6M U36 ( .A(n39), .B(n34), .Y(n10) );
  INVX4M U37 ( .A(n7), .Y(n38) );
  INVX8M U38 ( .A(n16), .Y(o_low) );
  NAND2X2M U39 ( .A(n9), .B(n15), .Y(n7) );
  NAND3X2M U40 ( .A(n16), .B(n39), .C(i_down), .Y(n15) );
  OAI22X1M U41 ( .A0(n24), .A1(n7), .B0(n38), .B1(n11), .Y(n20) );
  AOI222X2M U42 ( .A0(i_in[2]), .A1(n34), .B0(N15), .B1(n9), .C0(N9), .C1(n10), 
        .Y(n11) );
  OAI22X1M U43 ( .A0(n4), .A1(n7), .B0(n38), .B1(n8), .Y(n19) );
  AOI222X2M U44 ( .A0(n34), .A1(i_in[1]), .B0(N14), .B1(n9), .C0(N8), .C1(n10), 
        .Y(n8) );
  OAI22X1M U45 ( .A0(n27), .A1(n7), .B0(n38), .B1(n14), .Y(n23) );
  AOI222X2M U46 ( .A0(i_in[0]), .A1(n34), .B0(n5), .B1(n9), .C0(n27), .C1(n10), 
        .Y(n14) );
  OAI2BB2X1M U47 ( .B0(n38), .B1(n12), .A0N(o_counter[3]), .A1N(n38), .Y(n21)
         );
  AOI222X2M U48 ( .A0(i_in[3]), .A1(n34), .B0(N16), .B1(n9), .C0(N10), .C1(n10), .Y(n12) );
  OAI2BB2X1M U49 ( .B0(n38), .B1(n13), .A0N(o_counter[4]), .A1N(n38), .Y(n22)
         );
  AOI222X2M U50 ( .A0(i_in[4]), .A1(n34), .B0(N17), .B1(n9), .C0(N11), .C1(n10), .Y(n13) );
  INVX2M U51 ( .A(i_up), .Y(n39) );
  BUFX4M U52 ( .A(i_load), .Y(n34) );
  NOR2X2M U53 ( .A(n27), .B(n4), .Y(n18) );
  NAND4X2M U54 ( .A(n27), .B(n4), .C(n17), .D(n24), .Y(n16) );
  NOR2X1M U55 ( .A(n41), .B(o_counter[3]), .Y(n17) );
  ADDHX1M U56 ( .A(o_counter[1]), .B(o_counter[0]), .CO(\add_29/carry [2]), 
        .S(N8) );
  ADDHX1M U57 ( .A(o_counter[2]), .B(\add_29/carry [2]), .CO(\add_29/carry [3]), .S(N9) );
  ADDHX1M U58 ( .A(o_counter[3]), .B(\add_29/carry [3]), .CO(\add_29/carry [4]), .S(N10) );
  CLKXOR2X2M U59 ( .A(\add_29/carry [4]), .B(o_counter[4]), .Y(N11) );
  AO21XLM U60 ( .A0(o_counter[0]), .A1(o_counter[1]), .B0(n35), .Y(N14) );
  CLKNAND2X2M U61 ( .A(n35), .B(n28), .Y(n36) );
  OAI21X1M U62 ( .A0(n35), .A1(n28), .B0(n36), .Y(N15) );
  XNOR2X1M U63 ( .A(o_counter[3]), .B(n36), .Y(N16) );
  NOR2X1M U64 ( .A(o_counter[3]), .B(n36), .Y(n37) );
endmodule

