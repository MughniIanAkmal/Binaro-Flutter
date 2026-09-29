import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key});

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
          children: [
            const Row(
              children: [
                Icon(Icons.badge_outlined, color: Color(0xFF1769AA), size: 20),
                SizedBox(width: 8),
                Text(
                  "Data Sekolah & Siswa",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _row("Nama Wali/Orang Tua", "Ibu Endang Rahayu"),
            const Divider(),
            _row("Nomor Absen", "08"),
            const Divider(),
            _row("Tahun Ajaran", "2024/2025 (Genap)"),
          ],
        ),
      ),
    );
  }

  Widget _row(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              key,
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
