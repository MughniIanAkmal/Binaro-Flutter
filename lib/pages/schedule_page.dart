import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../models/schedule_item.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/schedule_card.dart';
import '../widgets/top_header.dart';

class CustomAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

class SchedulePage extends StatefulWidget {
  final bool showBottomNav;
  final ValueChanged<int>? onTabSelected;

  const SchedulePage({
    super.key,
    this.showBottomNav = false,
    this.onTabSelected,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int selectedDay = 0;

  final days = const ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final horizontal = width >= 900
            ? 48.0
            : width >= 600
            ? 32.0
            : 16.0;
        final maxContentWidth = width >= 1000 ? 980.0 : double.infinity;

        final content = Column(
          children: [
            TopHeader(
              title: 'Jadwal Mapel',
              matchMapelStyle: true,
              onAvatarTap: () {
                if (widget.onTabSelected != null) {
                  widget.onTabSelected!(4);
                } else {
                  Navigator.pushNamed(context, AppRoutes.profile);
                }
              },
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // Tombol Hari Horizontal Scroll (Sangat mulus dan responsif di layar mobile & sempit)
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 14, bottom: 10),
                        sliver: SliverToBoxAdapter(
                          child: SizedBox(
                            height: 52,
                            child: ScrollConfiguration(
                              behavior: CustomAppScrollBehavior(),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics(),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: horizontal,
                                ),
                                child: Row(
                                  children: List.generate(days.length, (index) {
                                    final active = selectedDay == index;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: index < days.length - 1 ? 8 : 0,
                                      ),
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () =>
                                            setState(() => selectedDay = index),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          curve: Curves.easeInOut,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 360 ? 12 : 14,
                                            vertical: 8,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: active
                                                ? AppColors.blue
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                            border: active
                                                ? null
                                                : Border.all(
                                                    color: const Color(
                                                      0xFFE5E7EB,
                                                    ),
                                                    width: 1.2,
                                                  ),
                                            boxShadow: active
                                                ? [
                                                    BoxShadow(
                                                      color: AppColors.blue
                                                          .withValues(
                                                            alpha: 0.25,
                                                          ),
                                                      blurRadius: 8,
                                                      offset: const Offset(
                                                        0,
                                                        3,
                                                      ),
                                                    ),
                                                  ]
                                                : const [
                                                    BoxShadow(
                                                      color: Color(0x08000000),
                                                      blurRadius: 6,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (active) ...[
                                                const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                const SizedBox(width: 6),
                                              ],
                                              Text(
                                                days[index],
                                                style: TextStyle(
                                                  color: active
                                                      ? Colors.white
                                                      : AppColors.greyText,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Baris Judul & Jumlah Pelajaran
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontal,
                          12,
                          horizontal,
                          16,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            children: [
                              Container(
                                width: 14,
                                height: 14,
                                decoration: const BoxDecoration(
                                  color: AppColors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Jadwal Hari ${days[selectedDay]}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              if (selectedDay == 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x0E000000),
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    '4 Pelajaran',
                                    style: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      // List Jadwal
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: horizontal),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final list = scheduleForDay(selectedDay);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: ScheduleCard(item: list[index]),
                            );
                          }, childCount: scheduleForDay(selectedDay).length),
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(bottom: 28)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );

        if (!widget.showBottomNav) {
          return content;
        }

        final isTablet = width >= 600;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: content),
          bottomNavigationBar: SafeArea(
            top: false,
            child: BottomNav(
              selectedIndex: 3,
              isTablet: isTablet,
              onChanged: (index) {
                if (index == 3) return;
                if (index == 0) {
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
                } else if (index == 1) {
                  Navigator.of(context).pushNamed(AppRoutes.subjects);
                } else if (index == 2) {
                  Navigator.of(context).pushNamed(AppRoutes.exam);
                } else if (index == 4) {
                  Navigator.of(context).pushNamed(AppRoutes.profile);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
