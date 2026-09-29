import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final bool isTablet;
  final ValueChanged<int> onChanged;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.isTablet,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_outlined, Icons.home, 'Beranda'),
      (Icons.menu_book_outlined, Icons.menu_book, 'Mapel'),
      (Icons.quiz_outlined, Icons.quiz, 'Ujian'),
      (Icons.calendar_month_outlined, Icons.calendar_month, 'Jadwal'),
      (Icons.person_outline, Icons.person, 'Profil'),
    ];

    return Container(
      height: isTablet ? 80 : 72,
      decoration: const BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final active = selectedIndex == index;

              return Expanded(
                child: InkWell(
                  onTap: () => onChanged(index),
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        active ? item.$2 : item.$1,
                        color: active ? AppColors.orange : Colors.white,
                        size: 26,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.$3,
                        style: TextStyle(
                          color: active ? AppColors.orange : Colors.white,
                          fontSize: isTablet ? 14 : 12,
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
