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
                Icon(Icons.school_outlined, color: Color(0xFF164E7A), size: 20),
                SizedBox(width: 8),
                Text(
                  "Data Sekolah & Siswa",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _row(Icons.family_restroom_outlined, "Nama Wali / Orang Tua", "Ibu Endang Rahayu", false),
            const Divider(height: 18, color: Color(0xFFF1F5F9)),
            _row(Icons.format_list_numbered_rounded, "Nomor Absen", "08", false),
            const Divider(height: 18, color: Color(0xFFF1F5F9)),
            _row(Icons.calendar_today_outlined, "Tahun Ajaran", "2024/2025 (Genap)", true),
          ],
        ),
      ),
    );
  }

  Widget _row(IconData icon, String key, String value, bool isBlue) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF64748B)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            key,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: isBlue ? const Color(0xFF164E7A) : const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
