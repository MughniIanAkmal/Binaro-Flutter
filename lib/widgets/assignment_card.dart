import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final color = item.orangeBar ? AppColors.orange : AppColors.blue;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ??
            () {
              Navigator.pushNamed(context, AppRoutes.homeworkNotifications);
            },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 8,
                offset: Offset(0, 3),
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
                    Icon(item.icon, color: color, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.subject.toUpperCase(),
                            style: GoogleFonts.plusJakartaSans(
                              color: color,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.text,
                              fontSize: 14.5,
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
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: compact ? 14 : 16),
                color: color,
                child: Row(
                  children: [
                    const Icon(Icons.access_time_rounded, color: Colors.white, size: 15),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item.deadline,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
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
                            style: GoogleFonts.plusJakartaSans(
                              color: color,
                              fontWeight: FontWeight.w800,
                              fontSize: 11.5,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.chevron_right,
                            color: color,
                            size: 15,
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
