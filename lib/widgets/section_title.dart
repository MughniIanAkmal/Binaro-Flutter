import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.text,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
