import 'package:flutter/material.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE4EAF0)),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.key_outlined,
                      color: Color(0xFF1769AA),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Ganti Kata Sandi",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Keamanan",
                    style: TextStyle(fontSize: 11, color: Color(0xFF1769AA)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _pwdField("Sandi Lama", "Masukkan kata sandi lama"),
            const SizedBox(height: 10),
            _pwdField("Sandi Baru", "Minimal 6 karakter"),
            const SizedBox(height: 10),
            _pwdField("Ulangi Sandi Baru", "Ketik kembali kata sandi baru"),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1769AA),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Simpan Kata Sandi Baru",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pwdField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF475569)),
        ),
        const SizedBox(height: 3),
        TextField(
          obscureText: true,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12),
            suffixIcon: const Icon(
              Icons.visibility_outlined,
              color: Color(0xFF64748B),
              size: 18,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
          ),
        ),
      ],
    );
  }
}
