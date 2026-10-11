`include "Affine.v"
`include "GF28_Inverse_Core.v"
module aes_Sbox_Math(
    input  wire [7:0] sbox_in,
    output wire [7:0] aes128_sbox
);
    wire [7:0] core_out;
    
    GF28_Inverse_Core u_core (
        .in_data(sbox_in), 
        .out_data(core_out)
    );
    
    Affine u_affine (
        .in(core_out), 
        .out(aes128_sbox)
    );
endmodule
