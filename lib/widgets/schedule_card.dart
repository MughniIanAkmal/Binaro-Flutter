import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/schedule_item.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleItem item;

  const ScheduleCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final compact = media.size.width < 380;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: item.orange ? AppColors.orange : AppColors.blue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 14 : 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: compact ? 48 : 54,
              height: compact ? 48 : 54,
              decoration: BoxDecoration(
                color: item.orange ? AppColors.orange : AppColors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item.icon,
                color: Colors.white,
                size: compact ? 27 : 30,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.subject,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.alarm, color: Colors.black54, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        item.time,
                        style: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
