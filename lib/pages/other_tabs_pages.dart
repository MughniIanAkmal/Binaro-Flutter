import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/top_header.dart';
import 'schedule_page.dart';

class ExamPage extends StatelessWidget {
  final bool showBottomNav;
  final ValueChanged<int>? onTabSelected;

  const ExamPage({
    super.key,
    this.showBottomNav = true,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isTablet = media.size.shortestSide >= 600;

    final content = Column(
      children: [
        TopHeader(
          title: 'Ujian',
          onAvatarTap: () {
            if (onTabSelected != null) {
              onTabSelected!(4);
            } else {
              Navigator.pushNamed(context, AppRoutes.profile);
            }
          },
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      color: AppColors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.quiz_outlined,
                      size: 40,
                      color: AppColors.blue,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Halaman Belum Dibuat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Fitur Ujian sedang dalam tahap pengembangan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    if (!showBottomNav) {
      return content;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: content),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNav(
          selectedIndex: 2,
          isTablet: isTablet,
          onChanged: (index) {
            _handleNav(context, index);
          },
        ),
      ),
    );
  }

  void _handleNav(BuildContext context, int index) {
    if (index == 2) return;
    if (index == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.home,
        (route) => false,
      );
    } else if (index == 1) {
      Navigator.of(context).pushNamed(AppRoutes.subjects);
    } else if (index == 3) {
      Navigator.of(context).pushNamed(AppRoutes.schedule);
    } else if (index == 4) {
      Navigator.of(context).pushNamed(AppRoutes.profile);
    }
  }
}

class SimpleSchedulePage extends StatelessWidget {
  const SimpleSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SchedulePage(showBottomNav: true);
  }
}

class ProfilePage extends StatelessWidget {
  final bool showBottomNav;
  final ValueChanged<int>? onTabSelected;

  const ProfilePage({
    super.key,
    this.showBottomNav = true,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isTablet = media.size.shortestSide >= 600;

    final content = Column(
      children: [
        TopHeader(
          title: 'Profil',
          onAvatarTap: () {
            // Already on Profile
          },
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      color: AppColors.lightOrange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 42,
                      color: AppColors.orange,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Halaman Belum Dibuat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Fitur Profil sedang dalam tahap pengembangan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    if (!showBottomNav) {
      return content;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: content),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNav(
          selectedIndex: 4,
          isTablet: isTablet,
          onChanged: (index) {
            _handleNav(context, index);
          },
        ),
      ),
    );
  }

  void _handleNav(BuildContext context, int index) {
    if (index == 4) return;
    if (index == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.home,
        (route) => false,
      );
    } else if (index == 1) {
      Navigator.of(context).pushNamed(AppRoutes.subjects);
    } else if (index == 2) {
      Navigator.of(context).pushNamed(AppRoutes.exam);
    } else if (index == 3) {
      Navigator.of(context).pushNamed(AppRoutes.schedule);
    }
  }
}
