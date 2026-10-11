module GF2_mul2 (
    input  wire [1:0] a,
    input  wire [1:0] b,
    output wire [1:0] p
);
    assign p[1] = (a[1] & b[1]) ^ (a[0] & b[1]) ^ (a[1] & b[0]);
    assign p[0] = (a[1] & b[1]) ^ (a[0] & b[0]);
endmodule

