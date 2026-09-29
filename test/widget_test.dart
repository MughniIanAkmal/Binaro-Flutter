import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:binaro_app/main.dart';
import 'package:binaro_app/pages/other_tabs_pages.dart';
import 'package:binaro_app/widgets/top_header.dart';
import 'package:binaro_app/widgets/bottom_nav.dart';

void main() {
  testWidgets('App smoke test and navigation verification', (WidgetTester tester) async {
    await tester.pumpWidget(const BinaroApp());
    expect(find.text('BINARO'), findsAny);
    expect(find.text('Beranda'), findsWidgets);
    expect(find.text('Mapel'), findsWidgets);
    expect(find.text('Ujian'), findsWidgets);
    expect(find.text('Jadwal'), findsWidgets);
    expect(find.text('Profil'), findsWidgets);

    // Switch to Ujian tab (tab index 2)
    await tester.tap(find.text('Ujian').first);
    await tester.pumpAndSettle();

    // Check Ujian page header and placeholder
    expect(find.byType(TopHeader), findsOneWidget);
    expect(find.text('Halaman Belum Dibuat'), findsOneWidget);
    expect(find.text('Fitur Ujian sedang dalam tahap pengembangan.'), findsOneWidget);
    // Verify hero section is NOT present
    expect(find.text('Penilaian Tengah Semester (PTS)'), findsNothing);
    expect(find.text('Simulasi Ujian Mandiri'), findsNothing);

    // Switch to Profil tab (tab index 4)
    await tester.tap(find.text('Profil').first);
    await tester.pumpAndSettle();

    // Check Profile page header and placeholder
    expect(find.byType(TopHeader), findsOneWidget);
    expect(find.text('Halaman Belum Dibuat'), findsOneWidget);
    expect(find.text('Fitur Profil sedang dalam tahap pengembangan.'), findsOneWidget);
    // Verify hero section is NOT present
    expect(find.text('Peringkat Kelas'), findsNothing);
    expect(find.text('Bintang Dikumpulkan'), findsNothing);
  });

  testWidgets('ExamPage standalone has Header, placeholder, and BottomNav', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ExamPage(showBottomNav: true),
      ),
    );
    expect(find.byType(TopHeader), findsOneWidget);
    expect(find.text('Halaman Belum Dibuat'), findsOneWidget);
    expect(find.byType(BottomNav), findsOneWidget);
  });

  testWidgets('ProfilePage standalone has Header, placeholder, and BottomNav', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfilePage(showBottomNav: true),
      ),
    );
    expect(find.byType(TopHeader), findsOneWidget);
    expect(find.text('Halaman Belum Dibuat'), findsOneWidget);
    expect(find.byType(BottomNav), findsOneWidget);
  });
}