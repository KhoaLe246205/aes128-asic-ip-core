`include "Inv_Affine.v"
`include "GF28_Inverse_Core.v"
module aes_InvSbox_Math(
    input  wire [7:0] sbox_in,
    output wire [7:0] aes128_inv_sbox
);
    wire [7:0] aff_out;
    
    Inv_Affine u_inv_affine (
        .in(sbox_in), 
        .out(aff_out)
    );
    
    GF28_Inverse_Core u_core (
        .in_data(aff_out), 
        .out_data(aes128_inv_sbox)
    );
endmodule
