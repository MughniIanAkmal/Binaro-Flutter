import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../models/assignment.dart';

class AssignmentCard extends StatelessWidget {
  final Assignment item;
  final VoidCallback? onTap;

  const AssignmentCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final compact = media.size.width < 390;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap:
            onTap ??
            () {
              Navigator.pushNamed(context, AppRoutes.homeworkNotifications);
            },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  compact ? 14 : 16,
                  14,
                  compact ? 14 : 16,
                  14,
                ),
                child: Row(
                  children: [
                    Icon(item.icon, color: AppColors.blue, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.subject.toUpperCase(),
                            style: const TextStyle(
                              color: AppColors.orange,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 42,
                padding: EdgeInsets.symmetric(horizontal: compact ? 14 : 16),
                color: item.orangeBar ? AppColors.orange : AppColors.blue,
                child: Row(
                  children: [
                    const Icon(Icons.alarm, color: Colors.white, size: 16),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item.deadline,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Buka',
                            style: TextStyle(
                              color: item.orangeBar
                                  ? AppColors.orange
                                  : AppColors.blue,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.chevron_right,
                            color: item.orangeBar
                                ? AppColors.orange
                                : AppColors.blue,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
