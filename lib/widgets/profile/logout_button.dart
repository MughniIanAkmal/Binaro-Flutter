import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFE4E4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, color: Color(0xFFDC2626), size: 16),
        label: const Text(
          "Keluar dari Akun",
          style: TextStyle(color: Color(0xFFDC2626), fontSize: 12),
        ),
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
