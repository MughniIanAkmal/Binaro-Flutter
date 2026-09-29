import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import 'home_page.dart';
import 'subject_list_page.dart';
import 'other_tabs_pages.dart';
import 'schedule_page.dart';
import '../widgets/profile/profile_page.dart' as profile;

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isTablet = media.size.shortestSide >= 600;

    // Pages are built lazily with the tab callback so switching works.
    final pages = [
      HomePage(onTabSelected: _onTabSelected),
      const SubjectListPage(showBackButton: false, showBottomNav: false),
      ExamPage(showBottomNav: false, onTabSelected: _onTabSelected),
      SchedulePage(showBottomNav: false, onTabSelected: _onTabSelected),
      profile.ProfilePage(showBottomNav: false, onTabSelected: _onTabSelected),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: pages),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNav(
          selectedIndex: selectedIndex,
          isTablet: isTablet,
          onChanged: _onTabSelected,
        ),
      ),
    );
  }
}
