import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PizzaSharingIllustration extends StatelessWidget {
  const PizzaSharingIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9EE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFDE68A)),
      ),
      child: Stack(
        children: [
          CustomPaint(
            painter: _PizzaSharingPainter(),
            size: const Size(double.infinity, 120),
          ),
          Positioned(
            left: 10,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF334155).withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.menu_book_rounded, color: Colors.white, size: 11),
                  const SizedBox(width: 4),
                  Text(
                    'Halaman 2 dari 6',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PizzaSharingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Room background elements
    final bgPaint = Paint()..color = const Color(0xFFFEF3C7).withValues(alpha: 0.6);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, w, h), const Radius.circular(12)), bgPaint);

    // Wall frame / window
    final framePaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(w * 0.4, 10, w * 0.2, 40), const Radius.circular(6)), framePaint);

    // Table
    final tablePaint = Paint()..color = const Color(0xFFFDE68A);
    canvas.drawRect(Rect.fromLTWH(20, h - 35, w - 40, 35), tablePaint);

    // Whole Pizza Pan in the center
    final panPaint = Paint()..color = const Color(0xFFCBD5E1);
    final pizzaCrustPaint = Paint()..color = const Color(0xFFD97706);
    final pizzaCheesePaint = Paint()..color = const Color(0xFFFBBF24);

    final pizzaCenter = Offset(w * 0.5, h - 25);
    canvas.drawOval(Rect.fromCenter(center: pizzaCenter, width: 70, height: 26), panPaint);
    canvas.drawOval(Rect.fromCenter(center: pizzaCenter, width: 62, height: 22), pizzaCrustPaint);
    canvas.drawOval(Rect.fromCenter(center: pizzaCenter, width: 54, height: 18), pizzaCheesePaint);

    // Pepperonis
    final peppPaint = Paint()..color = const Color(0xFFDC2626);
    canvas.drawCircle(Offset(w * 0.46, h - 26), 2.5, peppPaint);
    canvas.drawCircle(Offset(w * 0.52, h - 23), 2.5, peppPaint);
    canvas.drawCircle(Offset(w * 0.54, h - 27), 2.5, peppPaint);

    // Boy Character (Left)
    _drawStudentBoy(canvas, Offset(w * 0.32, h - 48));

    // Girl Character with Hijab (Right)
    _drawStudentGirl(canvas, Offset(w * 0.68, h - 48));
  }

  void _drawStudentBoy(Canvas canvas, Offset pos) {
    // Body uniform
    final uniformPaint = Paint()..color = Colors.white;
    final tiePaint = Paint()..color = const Color(0xFFDC2626);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(pos.dx - 14, pos.dy + 8, 28, 24), const Radius.circular(6)), uniformPaint);
    // Tie
    canvas.drawRect(Rect.fromLTWH(pos.dx - 2, pos.dy + 10, 4, 10), tiePaint);

    // Head & Hair
    final skinPaint = Paint()..color = const Color(0xFFFFD1A4);
    final hairPaint = Paint()..color = const Color(0xFF1E293B);
    canvas.drawCircle(Offset(pos.dx, pos.dy - 6), 14, hairPaint);
    canvas.drawCircle(Offset(pos.dx, pos.dy - 4), 12, skinPaint);
    canvas.drawArc(Rect.fromCenter(center: Offset(pos.dx, pos.dy - 8), width: 24, height: 14), 3.14, 3.14, true, hairPaint);

    // Eyes and smile
    final facePaint = Paint()..color = const Color(0xFF0F172A);
    canvas.drawCircle(Offset(pos.dx - 4, pos.dy - 4), 1.5, facePaint);
    canvas.drawCircle(Offset(pos.dx + 4, pos.dy - 4), 1.5, facePaint);
    canvas.drawArc(Rect.fromCenter(center: Offset(pos.dx, pos.dy - 1), width: 6, height: 4), 0, 3.14, false, Paint()..color = const Color(0xFFDC2626)..style = PaintingStyle.stroke..strokeWidth = 1.2);

    // Hand holding pizza slice
    final slicePaint = Paint()..color = const Color(0xFFF59E0B);
    final path = Path()
      ..moveTo(pos.dx + 12, pos.dy + 6)
      ..lineTo(pos.dx + 26, pos.dy + 2)
      ..lineTo(pos.dx + 20, pos.dy + 16)
      ..close();
    canvas.drawPath(path, slicePaint);
  }

  void _drawStudentGirl(Canvas canvas, Offset pos) {
    // Hijab (Cyan / Light Blue)
    final hijabPaint = Paint()..color = const Color(0xFF38BDF8);
    final uniformPaint = Paint()..color = Colors.white;
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(pos.dx - 14, pos.dy + 8, 28, 24), const Radius.circular(6)), uniformPaint);

    // Hijab round shape
    canvas.drawOval(Rect.fromCenter(center: Offset(pos.dx, pos.dy - 4), width: 28, height: 32), hijabPaint);
    // Face inner oval
    final skinPaint = Paint()..color = const Color(0xFFFFD1A4);
    canvas.drawOval(Rect.fromCenter(center: Offset(pos.dx, pos.dy - 4), width: 16, height: 20), skinPaint);

    // Eyes and smile
    final facePaint = Paint()..color = const Color(0xFF0F172A);
    canvas.drawCircle(Offset(pos.dx - 3.5, pos.dy - 4), 1.5, facePaint);
    canvas.drawCircle(Offset(pos.dx + 3.5, pos.dy - 4), 1.5, facePaint);
    canvas.drawArc(Rect.fromCenter(center: Offset(pos.dx, pos.dy - 1), width: 6, height: 4), 0, 3.14, false, Paint()..color = const Color(0xFFDC2626)..style = PaintingStyle.stroke..strokeWidth = 1.2);

    // Hand holding pizza slice
    final slicePaint = Paint()..color = const Color(0xFFF59E0B);
    final path = Path()
      ..moveTo(pos.dx - 12, pos.dy + 6)
      ..lineTo(pos.dx - 26, pos.dy + 2)
      ..lineTo(pos.dx - 20, pos.dy + 16)
      ..close();
    canvas.drawPath(path, slicePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
