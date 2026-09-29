import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../models/schedule_item.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/schedule_card.dart';
import '../widgets/top_header.dart';

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
    final filteredItems = scheduleForDay(selectedDay);

    final content = Column(
      children: [
        TopHeader(
          title: 'Jadwal Pelajaran',
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // Horizontal Day Pills
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(days.length, (index) {
                      final active = selectedDay == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => setState(() => selectedDay = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: active ? AppColors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: active
                                    ? AppColors.blue
                                    : const Color(0xFFCBD5E1),
                              ),
                            ),
                            child: Text(
                              days[index],
                              style: GoogleFonts.plusJakartaSans(
                                color: active
                                    ? Colors.white
                                    : const Color(0xFF475569),
                                fontSize: 12,
                                fontWeight: active
                                    ? FontWeight.w800
                                    : FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 14),

                // Schedule Cards List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      if (filteredItems.isEmpty)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Tidak ada jadwal pelajaran di hari ini.',
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF64748B),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      else
                        for (int i = 0; i < filteredItems.length; i++) ...[
                          ScheduleCard(item: filteredItems[i]),
                          const SizedBox(height: 10),
                        ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    if (!widget.showBottomNav) {
      return content;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(child: content),
      bottomNavigationBar: BottomNav(
        selectedIndex: 3,
        onChanged: (index) {
          if (widget.onTabSelected != null) {
            widget.onTabSelected!(index);
          } else {
            if (index == 0) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            } else if (index == 1) {
              Navigator.pushNamed(context, AppRoutes.subjects);
            } else if (index == 2) {
              Navigator.pushNamed(context, AppRoutes.exam);
            } else if (index == 4) {
              Navigator.pushNamed(context, AppRoutes.profile);
            }
          }
        },
      ),
    );
  }
}
