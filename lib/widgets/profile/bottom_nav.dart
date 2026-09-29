import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF1A56DB),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home, label: "Beranda", isActive: true),
          _NavItem(icon: Icons.menu_book, label: "Mapel"),
          _NavItem(icon: Icons.assignment, label: "Ujian"),
          _NavItem(icon: Icons.folder, label: "Induk"),
          _NavItem(icon: Icons.person, label: "Profil"),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? Colors.orange
        : Colors.white.withValues(alpha: 0.7);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 10)),
      ],
    );
  }
}
