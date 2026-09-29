import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/exam_stat_box.dart';

class ExamResultPage extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int totalQuestions;
  final int score;
  final int timeSpentMinutes;

  const ExamResultPage({
    Key? key,
    this.correctAnswers = 0,
    this.wrongAnswers = 0,
    this.totalQuestions = 20,
    this.score = 0,
    this.timeSpentMinutes = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPassed = score >= 75;

    // Keamanan nilai progress indicator agar tidak terkena Unsupported operation: NaN
    final double progressValue = (score <= 0 || score.isNaN)
        ? 0.0
        : (score / 100).clamp(0.0, 1.0);

    String teacherNote;
    String statusTitle;
    String statusDescription;

    if (score >= 90) {
      statusTitle = 'Hebat, Budi Santoso!';
      statusDescription = 'Sangat Baik & Membanggakan';
      teacherNote =
          '"Bagus sekali pemahaman materi pecahannya, pertahankan ya Budi!"';
    } else if (score >= 75) {
      statusTitle = 'Selamat, Budi Santoso!';
      statusDescription = 'Baik & Lulus KKM';
      teacherNote = '"Hasil pengerjaanmu sudah bagus dan lulus KKM. Tingkatkan lagi ketelitiannya ya Budi!"';
    } else {
      statusTitle = 'Tetap Semangat, Budi!';
      statusDescription = 'Perlu Tingkatkan Belajar';
      teacherNote = '"Jangan berkecil hati, pelajari lagi konsep dasar pecahannya dan tetap semangat latihan ya Budi!"';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: AppColors.primaryNavy,
        elevation: 0,
        title: const Text(
          'Hasil Ujian Siswa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Banner Atas
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isPassed
                          ? const Color(0xFFFFF4E5)
                          : const Color(0xFFF0F4F8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isPassed ? '🎉' : '💪',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Ujian telah selesai dikumpulkan tepat waktu!',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card Indikator Nilai Utama
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isPassed
                          ? const Color(0xFFE8F8F0)
                          : const Color(0xFFFFEBEB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isPassed ? Icons.check_circle : Icons.cancel,
                          size: 16,
                          color: isPassed ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isPassed
                              ? 'LULUS KKM (Target: 75)'
                              : 'BELUM LULUS KKM (Target: 75)',
                          style: TextStyle(
                            color: isPassed ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Circular Progress Skor Nilai (Aman NaN)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: CircularProgressIndicator(
                          value: progressValue,
                          strokeWidth: 14,
                          backgroundColor: const Color(0xFFE0E0E0),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isPassed ? AppColors.primaryNavy : Colors.orange,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$score',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: isPassed
                                  ? AppColors.primaryNavy
                                  : Colors.orange.shade800,
                            ),
                          ),
                          const Text(
                            'dari 100',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Text(
                    statusDescription,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Ringkasan Statistik Benar / Salah / Waktu Menit
            Row(
              children: [
                ExamStatBox(
                  icon: Icons.check_circle_outline,
                  value: '$correctAnswers',
                  label: 'Benar',
                  color: AppColors.primaryNavy,
                ),
                const SizedBox(width: 8),
                ExamStatBox(
                  icon: Icons.cancel_outlined,
                  value: '$wrongAnswers',
                  label: 'Salah',
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                ExamStatBox(
                  icon: Icons.access_time,
                  value: "$timeSpentMinutes'",
                  label: 'Menit',
                  color: AppColors.primaryNavy,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Mapel & Catatan Guru
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryNavy.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.calculate_outlined,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'MATA PELAJARAN',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'PTS Matematika Kelas 4B',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Ibu Sarah Wijaya, S.Pd.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.primaryNavy.withOpacity(
                            0.1,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: AppColors.primaryNavy,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    size: 14,
                                    color: AppColors.primaryNavy,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Catatan Guru',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryNavy,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                teacherNote,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 46,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primaryNavy),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book,
                      size: 18,
                      color: AppColors.primaryNavy,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Lihat Pembahasan Soal',
                      style: TextStyle(
                        color: AppColors.primaryNavy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, size: 18, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Kembali ke Daftar Ujian',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
