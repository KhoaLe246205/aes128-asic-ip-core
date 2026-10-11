`include "S.v"
`include "C.v"
`include "Imp.v"
`include "GF2_mul4.v"
`include "Inv.v"
`include "Imp_Inv.v"
module GF28_Inverse_Core (
    input  wire [7:0] in_data,
    output wire [7:0] out_data
);
    
    wire [7:0] mapped;
    Imp u_imp (.in(in_data), .out(mapped));

    wire [3:0] qH = mapped[7:4];
    wire [3:0] qL = mapped[3:0];

 
    wire [3:0] qH_sq, qH_sq_C;
    S u_S (.in(qH), .out(qH_sq));
    C u_C (.in(qH_sq), .out(qH_sq_C));

    
    wire [3:0] qH_qL = qH ^ qL;
    wire [3:0] X_bot;
    GF2_mul4 u_X_bot (.q(qH_qL), .w(qL), .k(X_bot));

    
    wire [3:0] d = qH_sq_C ^ X_bot;
    wire [3:0] d_inv;
    Inv u_Inv (.in(d), .out(d_inv));

    
    wire [3:0] kH, kL;
    GF2_mul4 u_X_top_right (.q(qH), .w(d_inv), .k(kH));
    GF2_mul4 u_X_bot_right (.q(qH_qL), .w(d_inv), .k(kL));

    
    Imp_Inv u_imp_inv (.in({kH, kL}), .out(out_data));
endmodule
