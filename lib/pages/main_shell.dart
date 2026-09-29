import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import 'home_page.dart';
import 'subject_list_page.dart';
import 'exam_list_page.dart';
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

    final pages = [
      HomePage(onTabSelected: _onTabSelected),
      const SubjectListPage(showBackButton: false, showBottomNav: false),
      ExamListPage(showBottomNav: false, onTabSelected: _onTabSelected),
      SchedulePage(showBottomNav: false, onTabSelected: _onTabSelected),
      profile.ProfilePage(showBottomNav: false, onTabSelected: _onTabSelected),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: BottomNav(
        selectedIndex: selectedIndex,
        isTablet: isTablet,
        onChanged: _onTabSelected,
      ),
    );
  }
}
