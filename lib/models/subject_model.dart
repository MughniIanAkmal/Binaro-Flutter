import 'package:flutter/material.dart';

enum SubjectCategory { semua, wajib, peminatan }

class SubjectModel {
  final String id;
  final String title;
  final String code;
  final String babCountText;
  final int totalBab;
  final int completedBab;
  final double progress; // 0.0 - 1.0
  final String schedule;
  final Color themeColor;
  final IconData iconData;
  final SubjectCategory category;

  const SubjectModel({
    required this.id,
    required this.title,
    required this.code,
    required this.babCountText,
    required this.totalBab,
    required this.completedBab,
    required this.progress,
    required this.schedule,
    required this.themeColor,
    required this.iconData,
    this.category = SubjectCategory.wajib,
  });
}
