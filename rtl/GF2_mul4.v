// `include "GF2_mul2.v"
module GF2_mul4 (
    input  wire [3:0] q,
    input  wire [3:0] w,
    output wire [3:0] k
);
    wire [1:0] qH = q[3:2]; wire [1:0] qL = q[1:0];
    wire [1:0] wH = w[3:2]; wire [1:0] wL = w[1:0];

    wire [1:0] A, B, C;
    GF2_mul2 mul_A (.a(qH),      .b(wH),      .p(A));
    GF2_mul2 mul_B (.a(qL),      .b(wL),      .p(B));
    GF2_mul2 mul_C (.a(qH ^ qL), .b(wH ^ wL), .p(C));

    wire [1:0] kH = B ^ C;
    wire [1:0] A_phi = {(A[1] ^ A[0]), A[1]};
    wire [1:0] kL = B ^ A_phi;

    assign k = {kH, kL};
endmodule

