module Affine (
    input  wire [7:0] in,
    output wire [7:0] out
);
    assign out[7] = in[7] ^ in[6] ^ in[5] ^ in[4] ^ in[3] ^ 1'b0;
    assign out[6] = in[6] ^ in[5] ^ in[4] ^ in[3] ^ in[2] ^ 1'b1;
    assign out[5] = in[5] ^ in[4] ^ in[3] ^ in[2] ^ in[1] ^ 1'b1;
    assign out[4] = in[4] ^ in[3] ^ in[2] ^ in[1] ^ in[0] ^ 1'b0;
    assign out[3] = in[7] ^ in[3] ^ in[2] ^ in[1] ^ in[0] ^ 1'b0;
    assign out[2] = in[7] ^ in[6] ^ in[2] ^ in[1] ^ in[0] ^ 1'b0;
    assign out[1] = in[7] ^ in[6] ^ in[5] ^ in[1] ^ in[0] ^ 1'b1;
    assign out[0] = in[7] ^ in[6] ^ in[5] ^ in[4] ^ in[0] ^ 1'b1;
endmodule
