import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Ujian & Evaluasi',
        showSubBrand: true,
        showBackButton: false,
        showNotifications: true,
        showAvatar: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExamItem(
            context: context,
            title: 'Penilaian Akhir Semester (PAS) Ganjil',
            questions: '40 Soal',
            duration: '90 Menit',
            color: AppColors.primaryNavy,
          ),
          const SizedBox(height: 10),
          _buildExamItem(
            context: context,
            title: 'Simulasi Matematika Paket A',
            questions: '25 Soal',
            duration: '60 Menit',
            color: AppColors.subjectMatematika,
          ),
          const SizedBox(height: 10),
          _buildExamItem(
            context: context,
            title: 'Simulasi IPA Sains Paket B',
            questions: '30 Soal',
            duration: '60 Menit',
            color: AppColors.subjectIPA,
          ),
        ],
      ),
      bottomNavigationBar: showBottomNav ? const CustomBottomNav(currentIndex: 2) : null,
    );
  }

  Widget _buildExamItem({
    required BuildContext context,
    required String title,
    required String questions,
    required String duration,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$questions • $duration',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.quiz);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryNavy,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Mulai', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
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

  const ProfilePage({super.key, this.showBottomNav = true, this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Profil Siswa',
        showSubBrand: true,
        showBackButton: false,
        showNotifications: true,
        showAvatar: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accentGold, width: 3),
                    color: const Color(0xFFFFFBEB),
                  ),
                  child: const Icon(Icons.person_rounded, size: 48, color: AppColors.primaryNavy),
                ),
                const SizedBox(height: 10),
                Text(
                  'Budi Santoso',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Kelas 5 SD • NISN: 0092837192',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.borderGrey),
            ),
            child: Column(
              children: [
                _buildProfileRow(Icons.military_tech_rounded, 'Peringkat Kelas', 'Juara 3'),
                const Divider(height: 16),
                _buildProfileRow(Icons.stars_rounded, 'Bintang Dikumpulkan', '48 ⭐'),
                const Divider(height: 16),
                _buildProfileRow(Icons.school_rounded, 'Sekolah', 'SD Negeri Nusantara 01'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: showBottomNav ? const CustomBottomNav(currentIndex: 4) : null,
    );
  }

  Widget _buildProfileRow(IconData icon, String label, String val) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryNavy, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          val,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryNavy,
          ),
        ),
      ],
    );
  }
}
