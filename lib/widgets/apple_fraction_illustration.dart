import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class AppleFractionIllustration extends StatelessWidget {
  const AppleFractionIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7EE),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1E3D3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top pill badge
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryNavy,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.search_rounded, color: Colors.white, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    'Ilustrasi Konsep 1/2',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Illustration Area
          SizedBox(
            height: 140,
            child: CustomPaint(
              painter: _AppleHalvesPainter(),
              size: const Size(double.infinity, 140),
            ),
          ),

          // Bottom Colorful Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFE3F2FD),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColorText('ONE ', const Color(0xFF1E88E5)),
                _buildColorText('WHOLE ', const Color(0xFFE53935)),
                _buildColorText('APPLE ', const Color(0xFFFB8C00)),
                _buildColorText('= ', const Color(0xFF43A047)),
                _buildColorText('TWO ', const Color(0xFF8E24AA)),
                _buildColorText('EQUAL ', const Color(0xFFD81B60)),
                _buildColorText('HALVES', const Color(0xFF00897B)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorText(String text, Color color) {
    return Text(
      text,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w900,
        color: color,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _AppleHalvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2 + 10;

    // 1. Draw Table Surface / Shelf
    final shelfPaint = Paint()
      ..color = const Color(0xFFDFC6B0)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, size.height - 18, size.width - 40, 8),
        const Radius.circular(4),
      ),
      shelfPaint,
    );

    // 2. Left Whole Apple (Small red sphere)
    final wholeApplePaint = Paint()
      ..color = const Color(0xFFE53935)
      ..style = PaintingStyle.fill;
    final appleX = centerX - 90;
    final appleY = centerY + 5;
    
    // Shadow
    canvas.drawOval(
      Rect.fromCenter(center: Offset(appleX, appleY + 26), width: 44, height: 10),
      Paint()..color = Colors.black.withValues(alpha: 0.08),
    );
    canvas.drawCircle(Offset(appleX, appleY), 24, wholeApplePaint);
    
    // Apple Stem & Leaf
    final stemPaint = Paint()
      ..color = const Color(0xFF5D4037)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(appleX, appleY - 24), Offset(appleX - 4, appleY - 32), stemPaint);
    
    final leafPaint = Paint()..color = const Color(0xFF4CAF50);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(appleX + 6, appleY - 28), width: 12, height: 6),
      leafPaint,
    );

    // 3. Two Apple Halves (Center & Right)
    _drawAppleHalf(
      canvas: canvas,
      center: Offset(centerX - 18, centerY + 2),
      isLeftHalf: true,
      fractionLabel: '1/2',
    );

    _drawAppleHalf(
      canvas: canvas,
      center: Offset(centerX + 46, centerY + 2),
      isLeftHalf: false,
      fractionLabel: '1/2',
    );
  }

  void _drawAppleHalf({
    required Canvas canvas,
    required Offset center,
    required bool isLeftHalf,
    required String fractionLabel,
  }) {
    // Shadow
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx, center.dy + 28), width: 50, height: 12),
      Paint()..color = Colors.black.withValues(alpha: 0.1),
    );

    // Outer Red Rind
    final redPaint = Paint()..color = const Color(0xFFE53935);
    final fleshPaint = Paint()..color = const Color(0xFFFFF7D6); // Creamy flesh

    canvas.save();
    canvas.translate(center.dx, center.dy);

    // Draw half apple shape
    final path = Path();
    if (isLeftHalf) {
      path.moveTo(0, -28);
      path.cubicTo(-28, -28, -32, 24, 0, 28);
      path.close();
    } else {
      path.moveTo(0, -28);
      path.cubicTo(28, -28, 32, 24, 0, 28);
      path.close();
    }

    // Red outer
    canvas.drawPath(path, redPaint);

    // Flesh inner
    final innerPath = Path();
    if (isLeftHalf) {
      innerPath.moveTo(-2, -25);
      innerPath.cubicTo(-24, -25, -28, 21, -2, 25);
      innerPath.close();
    } else {
      innerPath.moveTo(2, -25);
      innerPath.cubicTo(24, -25, 28, 21, 2, 25);
      innerPath.close();
    }
    canvas.drawPath(innerPath, fleshPaint);

    // Seed
    final seedPaint = Paint()..color = const Color(0xFF3E2723);
    final seedOffset = isLeftHalf ? const Offset(-8, -2) : const Offset(8, -2);
    canvas.drawOval(Rect.fromCenter(center: seedOffset, width: 4, height: 7), seedPaint);

    // Cute smiling eyes & smile
    final facePaint = Paint()..color = const Color(0xFF263238);
    final eyeX = isLeftHalf ? -12.0 : 12.0;
    canvas.drawCircle(Offset(eyeX, 6), 2, facePaint);
    
    // Cute smile
    final smilePaint = Paint()
      ..color = const Color(0xFFE53935)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(eyeX, 10), width: 8, height: 6),
      0,
      3.14,
      false,
      smilePaint,
    );

    // Leaf on top
    final leafPaint = Paint()..color = const Color(0xFF4CAF50);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(isLeftHalf ? -6 : 6, -32), width: 10, height: 5),
      leafPaint,
    );

    canvas.restore();

    // Fraction text floating above half
    final textPainter = TextPainter(
      text: TextSpan(
        text: fractionLabel,
        style: const TextStyle(
          color: Color(0xFF1E88E5),
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(center.dx - (textPainter.width / 2), center.dy - 56));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
