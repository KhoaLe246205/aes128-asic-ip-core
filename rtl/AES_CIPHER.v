`include "AES_Cipher_Core.v"
`include "AES_Key_Expand.v"
module AES_CIPHER(
  input wire clk,
  input wire rst_n,
  input wire [127:0] plain_text,
  input wire [127:0] cipher_key,
  
  output reg [127:0] cipher_text,
  output reg cipher_ready
);
  reg [127:0] round_key_out;
  reg begin_round, rkey_en;
  reg [3:0] round_num;
  // reg [127:0] plain_text_reg, cipher_key_reg;
  
  // always @(posedge clk or negedge rst_n) begin
  //   if(!rst_n)  begin
  //     plain_text_reg<=128'h0;
  //     cipher_key_reg<=128'h0;
  //   end
  //   else  begin
  //   plain_text_reg<=plain_text;
  //   cipher_key_reg<=cipher_key;
  //   end
  // end

  AES_Cipher_Core cipher_core (
    .clk(clk),
    .rst_n(rst_n),
    .plain_text(plain_text),
    .cipher_key(cipher_key),
    .round_key(round_key_out),
    .cipher_text(cipher_text),
    .begin_round(begin_round),
    .rkey_en(rkey_en),
    .round_num(round_num),
    .cipher_ready(cipher_ready)
  );
  AES_Key_Expand aes_key_expand (
    .clk(clk),
    .rst_n(rst_n),
    .round_num(round_num),
    .cipher_key(cipher_key),
    .begin_round(begin_round),
    .rkey_en(rkey_en),
    .round_key_out(round_key_out)
  );
endmodule
