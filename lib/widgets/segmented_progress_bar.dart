import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class SegmentedProgressBar extends StatelessWidget {
  final int currentStep; // 1-indexed (e.g. 3)
  final int totalSteps; // e.g. 5

  const SegmentedProgressBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Segments
        Expanded(
          child: Row(
            children: List.generate(totalSteps, (index) {
              final step = index + 1;
              Color segmentColor;
              if (step < currentStep) {
                // Completed previous steps -> Gold/Orange
                segmentColor = AppColors.accentOrange;
              } else if (step == currentStep) {
                // Current active step -> Solid Navy/Blue
                segmentColor = AppColors.primaryNavy;
              } else {
                // Future steps -> Muted light blue/grey
                segmentColor = const Color(0xFFE2E8F0);
              }

              return Expanded(
                child: Container(
                  height: 6,
                  margin: EdgeInsets.only(right: index < totalSteps - 1 ? 6 : 0),
                  decoration: BoxDecoration(
                    color: segmentColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'Soal $currentStep dari $totalSteps',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E5B94),
          ),
        ),
      ],
    );
  }
}
