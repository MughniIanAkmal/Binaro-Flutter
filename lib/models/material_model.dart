import 'package:flutter/material.dart';

enum LessonContentType { video, story, quiz }

class MaterialItemModel {
  final int number;
  final String title;
  final String description;
  final String durationOrInfo;
  final LessonContentType type;
  final IconData icon;
  final Color badgeColor;
  final Color borderColor;
  final Color buttonColor;
  final String buttonText;
  final bool isFeatured;
  final String? previewSubtitle;
  final String? pagesInfo;

  const MaterialItemModel({
    required this.number,
    required this.title,
    required this.description,
    required this.durationOrInfo,
    required this.type,
    required this.icon,
    required this.badgeColor,
    required this.borderColor,
    required this.buttonColor,
    this.buttonText = 'Buka Materi',
    this.isFeatured = false,
    this.previewSubtitle,
    this.pagesInfo,
  });
}
