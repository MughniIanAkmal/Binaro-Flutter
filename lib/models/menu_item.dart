import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });
}

const menuItems = [
  MenuItem(
    title: 'Mapel',
    icon: Icons.menu_book_outlined,
    backgroundColor: AppColors.orange,
  ),
  MenuItem(
    title: 'Ujian',
    icon: Icons.quiz_outlined,
    backgroundColor: AppColors.blueMedium,
  ),
  MenuItem(
    title: 'Jadwal',
    icon: Icons.calendar_month_outlined,
    backgroundColor: AppColors.blueDark,
  ),
];
