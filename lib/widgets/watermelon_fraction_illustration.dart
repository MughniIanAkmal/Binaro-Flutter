import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class WatermelonFractionIllustration extends StatelessWidget {
  final String caption;
  const WatermelonFractionIllustration({
    super.key,
    this.caption = '1 dari 4 potongan semangka diambil oleh Budi',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF), // soft blue background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomPaint(
                  painter: _WatermelonPainter(),
                  size: const Size(150, 150),
                ),
                // Orange badge "1" floating near the separated top-right slice
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.accentOrange,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '1',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            caption,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E5B94),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _WatermelonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.44;

    final redFleshPaint = Paint()
      ..color = const Color(0xFFEF4444) // vibrant watermelon red
      ..style = PaintingStyle.fill;

    final rindPaint = Paint()
      ..color = const Color(0xFF10B981) // bright green rind
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final darkRindPaint = Paint()
      ..color = const Color(0xFF047857) // dark green outer line
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final seedPaint = Paint()
      ..color = const Color(0xFF1E293B)
      ..style = PaintingStyle.fill;

    final angles = [
      {'start': -math.pi / 2, 'sweep': math.pi / 2, 'offset': const Offset(8, -8), 'isPulled': true},
      {'start': 0.0, 'sweep': math.pi / 2, 'offset': const Offset(2, 2), 'isPulled': false},
      {'start': math.pi / 2, 'sweep': math.pi / 2, 'offset': const Offset(-2, 2), 'isPulled': false},
      {'start': math.pi, 'sweep': math.pi / 2, 'offset': const Offset(-2, -2), 'isPulled': false},
    ];

    for (var slice in angles) {
      final startAngle = slice['start'] as double;
      final sweepAngle = slice['sweep'] as double;
      final offset = slice['offset'] as Offset;

      final sliceCenter = center + offset;
      final rect = Rect.fromCircle(center: sliceCenter, radius: radius);

      // Path for pie slice
      final path = Path()
        ..moveTo(sliceCenter.dx, sliceCenter.dy)
        ..arcTo(rect, startAngle + 0.04, sweepAngle - 0.08, false)
        ..close();

      // Draw flesh
      canvas.drawPath(path, redFleshPaint);

      // Draw green rind on arc
      canvas.drawArc(rect, startAngle + 0.04, sweepAngle - 0.08, false, rindPaint);
      canvas.drawArc(rect, startAngle + 0.04, sweepAngle - 0.08, false, darkRindPaint);

      // Draw seeds in this slice
      final midAngle = startAngle + (sweepAngle / 2);
      final seedDist1 = radius * 0.45;
      final seedDist2 = radius * 0.65;

      final s1 = sliceCenter + Offset(math.cos(midAngle - 0.25) * seedDist1, math.sin(midAngle - 0.25) * seedDist1);
      final s2 = sliceCenter + Offset(math.cos(midAngle + 0.25) * seedDist1, math.sin(midAngle + 0.25) * seedDist1);
      final s3 = sliceCenter + Offset(math.cos(midAngle) * seedDist2, math.sin(midAngle) * seedDist2);

      canvas.drawOval(Rect.fromCenter(center: s1, width: 3.5, height: 6), seedPaint);
      canvas.drawOval(Rect.fromCenter(center: s2, width: 3.5, height: 6), seedPaint);
      canvas.drawOval(Rect.fromCenter(center: s3, width: 3.5, height: 6), seedPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
