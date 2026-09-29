import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BarcodeCard extends StatelessWidget {
  const BarcodeCard({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.qr_code_2, color: Color(0xFF1769AA), size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Kartu & Barcode Absensi",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Chip(
                  label: const Text(
                    "Aktif",
                    style: TextStyle(color: Color(0xFF078C63), fontSize: 11),
                  ),
                  backgroundColor: Color(0xFFE3F8EF),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F6FF),
                border: Border.all(color: const Color(0xFFD5E5FA)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: 'NISN:0128492041',
                    size: 110,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(4),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tunjukkan QR ke pemindai absensi saat masuk sekolah',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "NISN: 0128492041",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.print, size: 16),
                    label: const Text(
                      "Cetak Kartu",
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1769AA),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      size: 16,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      "Simpan Barcode",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFBFDBFE)),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
