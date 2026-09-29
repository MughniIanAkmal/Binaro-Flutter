import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_colors.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'pages/main_shell.dart';
import 'pages/subject_list_page.dart';
import 'pages/chapter_list_page.dart';
import 'pages/subchapter_list_page.dart';
import 'pages/material_list_page.dart';
import 'pages/lesson_detail_page.dart';
import 'pages/quiz_page.dart';
import 'pages/homework_notification_page.dart';
import 'pages/exam_list_page.dart';
import 'pages/exam_detail_page.dart';
import 'pages/exam_page.dart';
import 'pages/exam_result.dart';
import 'pages/schedule_page.dart';
import 'widgets/profile/profile_page.dart' as profile;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryNavy,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.primaryNavy,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const BinaroApp());
}

class BinaroApp extends StatelessWidget {
  const BinaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binaro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const MainShell(),
        AppRoutes.subjects: (context) =>
            const SubjectListPage(showBackButton: true, showBottomNav: true),
        AppRoutes.chapters: (context) => const ChapterListPage(),
        AppRoutes.subchapters: (context) => const SubChapterListPage(),
        AppRoutes.materials: (context) => const MaterialListPage(),
        AppRoutes.lessonDetail: (context) => const LessonDetailPage(),
        AppRoutes.quiz: (context) => const QuizPage(),
        AppRoutes.homeworkNotifications: (context) =>
            const HomeworkNotificationPage(),
        AppRoutes.exam: (context) => const ExamListPage(showBottomNav: true),
        AppRoutes.examDetail: (context) => const ExamDetailPage(),
        AppRoutes.examPage: (context) => const ExamPage(),
        AppRoutes.examResult: (context) => const ExamResultPage(),
        AppRoutes.schedule: (context) => const SchedulePage(showBottomNav: true),
        AppRoutes.profile: (context) => const profile.ProfilePage(showBottomNav: true),
      },
    );
  }
}
