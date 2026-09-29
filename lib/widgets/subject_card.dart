import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_routes.dart';
import '../models/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final VoidCallback? onTap;

  const SubjectCard({super.key, required this.subject, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isOrange = subject.orange;
    final iconColor = isOrange ? const Color(0xFFEA580C) : const Color(0xFF2563EB);
    final iconBg = isOrange ? const Color(0xFFFFF7ED) : const Color(0xFFEFF6FF);
    final badgeBg = isOrange ? const Color(0xFFFEF3C7) : const Color(0xFFEFF6FF);
    final badgeText = isOrange ? const Color(0xFFD97706) : const Color(0xFF2563EB);
    final progressColor = isOrange ? const Color(0xFFFFA315) : const Color(0xFF164E7A);
    final progressBg = isOrange ? const Color(0xFFFEF3C7) : const Color(0xFFDBEAFE);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ??
            () {
              Navigator.pushNamed(context, AppRoutes.chapters);
            },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      subject.icon,
                      color: iconColor,
                      size: 22,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: badgeBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      subject.chapter,
                      style: GoogleFonts.plusJakartaSans(
                        color: badgeText,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
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
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF0F172A),
                  fontSize: 14.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${subject.done} dari ${subject.total} Materi',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF64748B),
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (subject.done / subject.total).clamp(0.0, 1.0),
                  minHeight: 6,
                  backgroundColor: progressBg,
                  color: progressColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
