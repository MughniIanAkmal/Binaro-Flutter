import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';
import '../models/assignment.dart';
import '../models/menu_item.dart';
import '../models/subject.dart';
import '../widgets/assignment_card.dart';
import '../widgets/section_title.dart';
import '../widgets/subject_card.dart';
import '../widgets/top_header.dart';
import '../widgets/view_all_button.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<int>? onTabSelected;

  const HomePage({super.key, this.onTabSelected});

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

        final subjectCrossAxisCount = width >= 900
            ? 4
            : width >= 600
            ? 3
            : 2;

        final subjectAspectRatio = width >= 900
            ? 1.15
            : width >= 600
            ? 1.05
            : 0.92;

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
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontal,
                          14,
                          horizontal,
                          20,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            const _Greeting(),
                            const SizedBox(height: 16),
                            const SectionTitle(title: 'Menu'),
                            const SizedBox(height: 14),
                            _HomeMenuBar(onTabSelected: onTabSelected),
                            const SizedBox(height: 20),
                            const SectionTitle(title: 'Tugas & PR Mendatang'),
                            const SizedBox(height: 14),
                          ]),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: horizontal),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: AssignmentCard(item: assignments[index]),
                            ),
                            childCount: assignments.length,
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: horizontal),
                        sliver: const SliverToBoxAdapter(
                          child: ViewAllButton(),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontal,
                          30,
                          horizontal,
                          14,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SectionTitle(title: 'Mata Pelajaran'),
                              GestureDetector(
                                onTap: () {
                                  if (onTabSelected != null) {
                                    onTabSelected!(1);
                                  } else {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.subjects,
                                    );
                                  }
                                },
                                child: const Text(
                                  'Semua',
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontal,
                          0,
                          horizontal,
                          32,
                        ),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                SubjectCard(subject: subjects[index]),
                            childCount: subjects.length,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: subjectCrossAxisCount,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: width < 600
                                    ? 0.98
                                    : subjectAspectRatio,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo, Budi Santoso!',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.school, size: 18, color: AppColors.blue),
            SizedBox(width: 6),
            Text(
              'Kelas 5 • SDN Kalitapen 01',
              style: TextStyle(
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
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: _MenuItemCard(
              item: menuItems[i],
              onTap: () {
                // i == 0: Mapel -> Tab 1
                // i == 1: Ujian -> Tab 2
                // i == 2: Jadwal -> Tab 3
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxWidth < 110 ? 92.0 : 100.0;
        final iconSize = constraints.maxWidth < 110 ? 28.0 : 32.0;
        const fontSize = 12.0;

        return Container(
          height: cardHeight,
          decoration: BoxDecoration(
            color: item.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.white, size: iconSize),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
