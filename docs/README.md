# 📚 Tài Liệu Kỹ Thuật & Tham Khảo (Technical Documents & References)

Thư mục này chứa tài liệu đặc tả chuẩn và các nguồn tài liệu tham khảo cho dự án **128-bit AES Cryptographic Engine**.

---

## 1. Tiêu Chuẩn Quốc Tế (Official Specification)
* [**`AES_128.pdf`**](./AES_128.pdf)  
  * Tiêu chuẩn chính thức **NIST FIPS PUB 197 (Advanced Encryption Standard - AES)** do Viện Tiêu chuẩn và Công nghệ Quốc gia Hoa Kỳ (NIST) ban hành.
  * Cung cấp cơ sở toán học, các phép biến đổi ma trận State, cấu trúc 10 vòng mã hóa và bộ vector kiểm thử Known Answer Test (KAT).

---

## 2. Tài Liệu Thiết Kế Vi Kiến Trúc & Tối Ưu S-Box (Design References)
* 🔗 [**[AES] Bài 5 - Tối ưu logic tính S-Box dựa trên biến đổi toán học (VLSI Technology)**](https://nguyenquanicd.blogspot.com/2019/10/aes-bai-5-toi-uu-logic-tinh-s-box-dua.html)  
  * **Tác giả**: Nguyễn Quân (Nguyen Quan ICD).
  * **Nội dung tham khảo**:
    * Phân tích toán học phân rã trường hữu hạn Galois Composite Field:
      $$\mathbb{F}_{2^8} \cong \mathbb{F}_{(2^4)^2} \cong \mathbb{F}_{((2^2)^2)^2}$$
    * Phương pháp ánh xạ đẳng cấu thuận ($\delta$) và nghịch ($\delta^{-1}$) qua ma trận `Imp` và `Imp_Inv`.
    * Tối ưu hóa mạch tổ hợp tính nghịch đảo nhân trên trường con $GF(2^4)$ và $GF(2^2)$ giúp tiết kiệm diện tích silicon so với bảng tra cứu ROM/LUT 256 bytes truyền thống.
