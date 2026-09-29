import 'package:flutter/material.dart';
import '../core/app_routes.dart';
import 'bottom_nav.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNav({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNav(
      selectedIndex: currentIndex,
      onChanged: (index) {
        if (onTap != null) {
          onTap!(index);
        } else {
          _handleNavigation(context, index);
        }
      },
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    if (index == currentIndex) return;

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
    } else if (index == 4) {
      Navigator.of(context).pushNamed(AppRoutes.profile);
    }
  }
}
