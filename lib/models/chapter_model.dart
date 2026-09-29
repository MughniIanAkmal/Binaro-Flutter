import 'package:flutter/material.dart';

class ChapterModel {
  final int number;
  final String title;
  final String? subtitle;
  final bool isLocked;
  final Color accentColor;
  final Color borderColor;
  final Color buttonColor;
  final String buttonText;
  final int subChapterCount;
  final double progress;

  const ChapterModel({
    required this.number,
    required this.title,
    this.subtitle,
    this.isLocked = false,
    required this.accentColor,
    required this.borderColor,
    required this.buttonColor,
    this.buttonText = 'Buka >',
    this.subChapterCount = 4,
    this.progress = 0.0,
  });
}
