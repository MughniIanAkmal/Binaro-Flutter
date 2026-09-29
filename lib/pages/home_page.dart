import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../models/assignment.dart';
import '../models/menu_item.dart';
import '../models/subject.dart';
import '../widgets/assignment_card.dart';
import '../widgets/subject_card.dart';
import '../widgets/top_header.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<int>? onTabSelected;

  const HomePage({super.key, this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopHeader(
          title: 'Beranda',
          matchMapelStyle: true,
          onAvatarTap: () {
            if (onTabSelected != null) {
              onTabSelected!(4);
            } else {
              Navigator.pushNamed(context, AppRoutes.profile);
            }
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                const _Greeting(),
                const SizedBox(height: 16),

                // Menu Section
                Text(
                  'Menu',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                _HomeMenuBar(onTabSelected: onTabSelected),
                const SizedBox(height: 20),

                // Tugas & PR Mendatang
                Text(
                  'Tugas & PR Mendatang',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 12),
                for (int i = 0; i < assignments.length; i++) ...[
                  AssignmentCard(item: assignments[i]),
                  const SizedBox(height: 12),
                ],

                // Lihat Semua Tugas link
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.homeworkNotifications);
                    },
                    iconAlignment: IconAlignment.end,
                    label: Text(
                      'Lihat Semua Tugas (5)',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Mata Pelajaran Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mata Pelajaran',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (onTabSelected != null) {
                          onTabSelected!(1);
                        } else {
                          Navigator.pushNamed(context, AppRoutes.subjects);
                        }
                      },
                      child: Text(
                        'Semua',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Mata Pelajaran 2x2 Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjects.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.96,
                  ),
                  itemBuilder: (context, index) =>
                      SubjectCard(subject: subjects[index]),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo, Budi Santoso!',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF0F172A),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.school_rounded, size: 16, color: AppColors.blue),
            const SizedBox(width: 6),
            Text(
              'Kelas 5 • SDN Kalitapen 01',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.blue,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HomeMenuBar extends StatelessWidget {
  final ValueChanged<int>? onTabSelected;

  const _HomeMenuBar({this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < menuItems.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(
            child: _MenuItemCard(
              item: menuItems[i],
              onTap: () {
                if (onTabSelected != null) {
                  onTabSelected!(i + 1);
                } else {
                  if (i == 0) {
                    Navigator.pushNamed(context, AppRoutes.subjects);
                  } else if (i == 1) {
                    Navigator.pushNamed(context, AppRoutes.exam);
                  } else if (i == 2) {
                    Navigator.pushNamed(context, AppRoutes.schedule);
                  }
                }
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback? onTap;

  const _MenuItemCard({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.backgroundColor,
      borderRadius: BorderRadius.circular(16),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 88,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, color: Colors.white, size: 26),
              const SizedBox(height: 6),
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
