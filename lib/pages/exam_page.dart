import 'dart:async';

import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'exam_result.dart';

// Model Data Soal Ujian
class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex; // 0 = A, 1 = B, 2 = C, 3 = D

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int currentIndex = 0;
  List<int?> selectedAnswers = List.filled(20, null);

  // 20 Soal Matematika Variatif Khas SD/SMP
  final List<QuestionModel> questionsList = [
    QuestionModel(
      question: 'Hasil perhitungan dari 125 + 75 : 5 adalah...',
      options: ['140', '135', '150', '200'],
      correctAnswerIndex: 0, // A (140)
    ),
    QuestionModel(
      question: 'Bentuk persen dari pecahan 3/5 adalah...',
      options: ['30%', '40%', '60%', '75%'],
      correctAnswerIndex: 2, // C (60%)
    ),
    QuestionModel(
      question: 'KPK dari bilangan 12 dan 18 adalah...',
      options: ['24', '36', '48', '72'],
      correctAnswerIndex: 1, // B (36)
    ),
    QuestionModel(
      question: 'FPB dari bilangan 24 dan 36 adalah...',
      options: ['6', '8', '12', '18'],
      correctAnswerIndex: 2, // C (12)
    ),
    QuestionModel(
      question: 'Hasil dari 15² - √144 adalah...',
      options: ['213', '215', '225', '237'],
      correctAnswerIndex: 0, // A (213)
    ),
    QuestionModel(
      question: 'Sebuah persegi memiliki panjang sisi 14 cm. Luas persegi tersebut adalah...',
      options: ['56 cm²', '196 cm²', '216 cm²', '256 cm²'],
      correctAnswerIndex: 1, // B (196 cm²)
    ),
    QuestionModel(
      question: 'Keliling lingkaran dengan jari-jari 7 cm adalah... (π = 22/7)',
      options: ['22 cm', '44 cm', '88 cm', '154 cm'],
      correctAnswerIndex: 1, // B (44 cm)
    ),
    QuestionModel(
      question: 'Hasil dari -12 + 8 x (-3) adalah...',
      options: ['12', '-12', '-36', '36'],
      correctAnswerIndex: 2, // C (-36)
    ),
    QuestionModel(
      question: 'Pecahan desimal dari 7/8 adalah...',
      options: ['0,78', '0,825', '0,85', '0,875'],
      correctAnswerIndex: 3, // D (0,875)
    ),
    QuestionModel(
      question: 'Sebuah balok memiliki panjang 10 cm, lebar 6 cm, dan tinggi 5 cm. Volume balok adalah...',
      options: ['300 cm³', '360 cm³', '400 cm³', '600 cm³'],
      correctAnswerIndex: 0, // A (300 cm³)
    ),
    QuestionModel(
      question: 'Sudut siku-siku memiliki besar sudut sebesar...',
      options: ['45°', '90°', '180°', '360°'],
      correctAnswerIndex: 1, // B (90°)
    ),
    QuestionModel(
      question: 'Budi membeli 3 buku seharga Rp 15.000,00. Harga 5 buku yang sama adalah...',
      options: ['Rp 20.000,00', 'Rp 22.500,00', 'Rp 25.000,00', 'Rp 30.000,00'],
      correctAnswerIndex: 2, // C (25.000)
    ),
    QuestionModel(
      question: 'Sebuah bus berangkat pukul 07.00 dan sampai pukul 09.30. Lama perjalanan bus adalah...',
      options: ['2 jam', '2 jam 30 menit', '3 jam', '3 jam 30 menit'],
      correctAnswerIndex: 1, // B (2 jam 30 menit)
    ),
    QuestionModel(
      question: 'Hasil pengerjaan dari 2/3 + 1/4 adalah...',
      options: ['3/7', '8/12', '11/12', '10/12'],
      correctAnswerIndex: 2, // C (11/12)
    ),
    QuestionModel(
      question: 'Rata-rata dari data nilai: 7, 8, 6, 9, 10 adalah...',
      options: ['7,5', '8,0', '8,5', '9,0'],
      correctAnswerIndex: 1, // B (8,0)
    ),
    QuestionModel(
      question: 'Sebuah segitiga alasnya 12 cm dan tingginya 8 cm. Luas segitiga tersebut adalah...',
      options: ['20 cm²', '48 cm²', '96 cm²', '108 cm²'],
      correctAnswerIndex: 1, // B (48 cm²)
    ),
    QuestionModel(
      question: 'Hasil dari 4,5 x 0,2 adalah...',
      options: ['0,09', '0,9', '9,0', '0,45'],
      correctAnswerIndex: 1, // B (0,9)
    ),
    QuestionModel(
      question: 'Bangun datar yang memiliki 4 sisi sama panjang dan sudut siku-siku adalah...',
      options: ['Persegi Panjang', 'Jajar Genjang', 'Persegi', 'Belah Ketupat'],
      correctAnswerIndex: 2, // C (Persegi)
    ),
    QuestionModel(
      question: 'Bentuk sederhana dari pecahan 16/24 adalah...',
      options: ['1/2', '2/3', '3/4', '4/5'],
      correctAnswerIndex: 1, // B (2/3)
    ),
    QuestionModel(
      question: 'Suhu mula-mula sebuah ruangan -4°C, kemudian naik 10°C. Suhu ruangan sekarang adalah...',
      options: ['-14°C', '-6°C', '6°C', '14°C'],
      correctAnswerIndex: 2, // C (6°C)
    ),
  ];

  // Logika Timer Dinamis
  late Timer _timer;
  int _startSeconds = 3600; // 60 Menit
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startSeconds > 0) {
        setState(() {
          _startSeconds--;
        });
      } else {
        _timer.cancel();
        _submitExam(); // Auto submit jika waktu habis
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    String minStr = minutes.toString().padLeft(2, '0');
    String secStr = seconds.toString().padLeft(2, '0');
    return '$minStr:$secStr';
  }

  void _submitExam() {
    _timer.cancel();

    // Hitung jumlah jawaban benar dan salah
    int correctCount = 0;
    int wrongCount = 0;

    for (int i = 0; i < questionsList.length; i++) {
      if (selectedAnswers[i] != null) {
        if (selectedAnswers[i] == questionsList[i].correctAnswerIndex) {
          correctCount++;
        } else {
          wrongCount++;
        }
      } else {
        wrongCount++; // Tidak dijawab dihitung salah
      }
    }

    // Perhitungan skor akhir (skala 100)
    int finalScore = ((correctCount / questionsList.length) * 100).round();

    // Hitung waktu pengerjaan dalam menit
    final DateTime endTime = DateTime.now();
    int timeSpentMinutes = endTime.difference(_startTime).inMinutes;
    if (timeSpentMinutes == 0) timeSpentMinutes = 1;

    // Pindah ke Halaman Hasil Ujian
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ExamResultPage(
          correctAnswers: correctCount,
          wrongAnswers: wrongCount,
          totalQuestions: questionsList.length,
          score: finalScore,
          timeSpentMinutes: timeSpentMinutes,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsList[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: AppColors.primaryNavy,
        elevation: 0,
        title: Text(
          'Soal ${currentIndex + 1} dari ${questionsList.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Text(
                  _formatTime(_startSeconds),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Teks Pertanyaan Dinamis
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${currentIndex + 1}. ${currentQuestion.question}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Pilihan Jawaban A, B, C, D Dinamis
            ...List.generate(currentQuestion.options.length, (index) {
              final labels = ['A', 'B', 'C', 'D'];
              final isSelected = selectedAnswers[currentIndex] == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswers[currentIndex] = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryNavy.withOpacity(0.1)
                        : Colors.white,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryNavy
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: isSelected
                            ? AppColors.primaryNavy
                            : Colors.grey.shade200,
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          currentQuestion.options[index],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const Spacer(),

            // Tombol Navigasi Pindah Soal / Kumpulkan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  OutlinedButton(
                    onPressed: () => setState(() => currentIndex--),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primaryNavy),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sebelumnya',
                      style: TextStyle(color: AppColors.primaryNavy),
                    ),
                  )
                else
                  const SizedBox(),
                if (currentIndex < questionsList.length - 1)
                  ElevatedButton(
                    onPressed: () => setState(() => currentIndex++),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryNavy,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Berikutnya',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _submitExam,
                    child: const Text(
                      'Kumpulkan Ujian',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
