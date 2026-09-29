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
    icon: Icons.menu_book_rounded,
    backgroundColor: AppColors.orange,
  ),
  MenuItem(
    title: 'Ujian',
    icon: Icons.assignment_outlined,
    backgroundColor: AppColors.blue,
  ),
  MenuItem(
    title: 'Jadwal',
    icon: Icons.calendar_today_rounded,
    backgroundColor: AppColors.blue,
  ),
];
