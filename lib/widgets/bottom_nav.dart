import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final bool isTablet;
  final ValueChanged<int> onChanged;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    this.isTablet = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_outlined, Icons.home_rounded, 'Beranda'),
      (Icons.menu_book_outlined, Icons.menu_book_rounded, 'Mapel'),
      (Icons.assignment_outlined, Icons.assignment_rounded, 'Ujian'),
      (Icons.calendar_today_outlined, Icons.calendar_today_rounded, 'Jadwal'),
      (Icons.account_circle_outlined, Icons.account_circle_rounded, 'Profil'),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final active = selectedIndex == index;

              return Expanded(
                child: InkWell(
                  onTap: () => onChanged(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        active ? item.$2 : item.$1,
                        color: active
                            ? AppColors.orange
                            : Colors.white.withValues(alpha: 0.75),
                        size: 22,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.$3,
                        style: GoogleFonts.plusJakartaSans(
                          color: active
                              ? AppColors.orange
                              : Colors.white.withValues(alpha: 0.75),
                          fontSize: 11,
                          fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
