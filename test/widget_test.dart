import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:binaro_profile/main.dart';
import 'package:binaro_profile/widgets/login/login_mobile.dart';
import 'package:binaro_profile/widgets/profile/profile_page.dart' as profile;

void main() {
  testWidgets('App login and logout flow verification', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BinaroApp());
    await tester.pumpAndSettle();

    // 1. Initially should be on Login Page
    expect(find.text('Login'), findsWidgets);
    expect(find.text('Siswa'), findsWidgets);
    expect(find.text('Guru'), findsWidgets);
    expect(find.text('Admin'), findsWidgets);

    // 2. Tap Login button to navigate to Dashboard (MainShell)
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);
    await tester.ensureVisible(loginButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // 3. Verify Dashboard / MainShell is loaded
    expect(find.text('Beranda'), findsWidgets);
    expect(find.text('Mapel'), findsWidgets);
    expect(find.text('Ujian'), findsWidgets);
    expect(find.text('Jadwal'), findsWidgets);
    expect(find.text('Profil'), findsWidgets);

    // 4. Switch to Profil tab (tab index 4)
    await tester.tap(find.text('Profil').first);
    await tester.pumpAndSettle();

    // Verify profile page is shown
    expect(find.text('Budi Santoso'), findsOneWidget);
    expect(find.text('Kartu & Barcode Absensi'), findsOneWidget);
    final logoutBtn = find.text('Keluar dari Akun');
    expect(logoutBtn, findsOneWidget);

    // 5. Tap Logout button
    await tester.ensureVisible(logoutBtn);
    await tester.tap(logoutBtn);
    await tester.pumpAndSettle();

    // Check confirmation dialog appears
    expect(find.text('Apakah Anda yakin ingin keluar dari aplikasi?'), findsOneWidget);

    // Tap confirm logout button
    final confirmLogoutBtn = find.widgetWithText(ElevatedButton, 'Keluar');
    await tester.tap(confirmLogoutBtn);
    await tester.pumpAndSettle();

    // 6. Verify we are back on Login Page
    expect(find.text('Login'), findsWidgets);
    expect(find.text('Masuk sebagai Siswa'), findsOneWidget);
  });

  testWidgets('LoginMobilePage standalone renders properly and role selection works', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginMobilePage()),
    );
    expect(find.text('Login'), findsWidgets);
    expect(find.text('Masuk sebagai Siswa'), findsOneWidget);

    // Switch role to Guru
    await tester.tap(find.text('Guru'));
    await tester.pumpAndSettle();
    expect(find.text('Masuk sebagai Guru'), findsOneWidget);
    expect(find.text('Email / NIP Guru'), findsOneWidget);
  });

  testWidgets('ProfilePage standalone shows profile content and BottomNav', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: profile.ProfilePage(showBottomNav: true)),
    );
    expect(find.text('Budi Santoso'), findsOneWidget);
    expect(find.text('Keluar dari Akun'), findsOneWidget);
  });
}
