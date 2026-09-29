import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_colors.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'pages/subject_list_page.dart';
import 'pages/chapter_list_page.dart';
import 'pages/subchapter_list_page.dart';
import 'pages/material_list_page.dart';
import 'pages/lesson_detail_page.dart';
import 'pages/quiz_page.dart';
import 'pages/homework_notification_page.dart';

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
      initialRoute: AppRoutes.subjects,
      routes: {
        AppRoutes.subjects: (context) => const SubjectListPage(),
        AppRoutes.chapters: (context) => const ChapterListPage(),
        AppRoutes.subchapters: (context) => const SubChapterListPage(),
        AppRoutes.materials: (context) => const MaterialListPage(),
        AppRoutes.lessonDetail: (context) => const LessonDetailPage(),
        AppRoutes.quiz: (context) => const QuizPage(),
        AppRoutes.homeworkNotifications: (context) =>
            const HomeworkNotificationPage(),
      },
    );
  }
}
