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
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.orange ? AppColors.orange : AppColors.blue,
        borderRadius: BorderRadius.circular(22),
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
          horizontal: compact ? 16 : 20,
          vertical: compact ? 16 : 18,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: compact ? 64 : 72,
              height: compact ? 64 : 72,
              decoration: BoxDecoration(
                color: item.orange ? AppColors.orange : AppColors.blue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                item.icon,
                color: Colors.white,
                size: compact ? 34 : 38,
              ),
            ),
            const SizedBox(width: 16),
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
                      fontSize: compact ? 18 : 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.alarm,
                        color: Colors.black54,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item.time,
                        style: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 15,
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
