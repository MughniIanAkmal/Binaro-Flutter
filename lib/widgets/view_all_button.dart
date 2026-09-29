import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';

class ViewAllButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ViewAllButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap:
              onTap ??
              () {
                Navigator.pushNamed(context, AppRoutes.homeworkNotifications);
              },
          child: const Center(
            child: Text(
              'Lihat Semua Tugas (5)  →',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
