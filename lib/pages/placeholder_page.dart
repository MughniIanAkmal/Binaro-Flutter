import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/top_header.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;
  final IconData? icon;

  const PlaceholderPage({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopHeader(title: title),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      color: AppColors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon ?? Icons.construction_rounded,
                      size: 40,
                      color: AppColors.blue,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Halaman Belum Dibuat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fitur $title sedang dalam tahap pengembangan.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
