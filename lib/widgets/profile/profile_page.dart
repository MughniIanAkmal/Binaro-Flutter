import 'package:flutter/material.dart';

import '../../core/app_routes.dart';
import '../bottom_nav.dart' as app_nav;
import '../top_header.dart';
import 'attendance_card.dart';
import 'barcode_card.dart';
import 'data_card.dart';
import 'logout_button.dart';
import 'password_card.dart';
import 'profile_section.dart';

export 'header.dart';
export 'profile_section.dart';
export 'barcode_card.dart';
export 'attendance_card.dart';
export 'data_card.dart';
export 'logout_button.dart';
export 'password_card.dart';
export 'bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  final bool showBottomNav;
  final ValueChanged<int>? onTabSelected;

  const ProfilePage({super.key, this.showBottomNav = true, this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isTablet = media.size.shortestSide >= 600;
    final content = Column(
      children: [
        TopHeader(title: 'Profil', onAvatarTap: () {}, matchMapelStyle: true),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ProfileSection(),
                      SizedBox(height: 12),
                      BarcodeCard(),
                      SizedBox(height: 12),
                      AttendanceCard(),
                      SizedBox(height: 12),
                      DataCard(),
                      SizedBox(height: 12),
                      LogoutButton(),
                      SizedBox(height: 12),
                      PasswordCard(),
                      SizedBox(height: 12),
                      _AppVersionCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    if (!showBottomNav) return content;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9),
      body: SafeArea(child: content),
      bottomNavigationBar: SafeArea(
        top: false,
        child: app_nav.BottomNav(
          selectedIndex: 4,
          isTablet: isTablet,
          onChanged: (index) {
            if (onTabSelected != null) {
              onTabSelected!(index);
            } else {
              _handleNav(context, index);
            }
          },
        ),
      ),
    );
  }

  void _handleNav(BuildContext context, int index) {
    if (index == 4) return;
    if (index == 0) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    } else if (index == 1) {
      Navigator.of(context).pushNamed(AppRoutes.subjects);
    } else if (index == 2) {
      Navigator.of(context).pushNamed(AppRoutes.exam);
    } else if (index == 3) {
      Navigator.of(context).pushNamed(AppRoutes.schedule);
    }
  }
}

class _AppVersionCard extends StatelessWidget {
  const _AppVersionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFE4EAF0)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: Color(0xFF1769AA)),
          SizedBox(width: 8),
          Text('Versi Aplikasi', style: TextStyle(fontSize: 12)),
          Spacer(),
          Text(
            'Binaro v1.2.0 SD',
            style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}
