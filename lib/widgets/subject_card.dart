import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../models/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final VoidCallback? onTap;

  const SubjectCard({super.key, required this.subject, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap:
            onTap ??
            () {
              Navigator.pushNamed(context, AppRoutes.chapters);
            },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: subject.orange
                          ? AppColors.lightOrange
                          : AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      subject.icon,
                      color: subject.orange ? AppColors.orange : AppColors.blue,
                      size: 23,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: subject.orange
                          ? AppColors.lightOrange
                          : AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      subject.chapter,
                      style: TextStyle(
                        color: subject.orange
                            ? AppColors.orange
                            : AppColors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                subject.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${subject.done} dari ${subject.total} Materi',
                style: TextStyle(
                  color: subject.orange ? AppColors.orange : AppColors.greyText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: subject.done / subject.total,
                  minHeight: 6,
                  backgroundColor: subject.orange
                      ? AppColors.lightOrange
                      : const Color(0xFFDCE6FA),
                  color: subject.orange ? AppColors.orange : AppColors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
