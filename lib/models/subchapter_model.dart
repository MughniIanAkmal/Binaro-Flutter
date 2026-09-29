import 'package:flutter/material.dart';

class SubChapterModel {
  final int number;
  final String title;
  final String? subtitle;
  final bool isLocked;
  final bool isExpanded;
  final IconData iconData;
  final Color iconColor;
  final Color borderColor;
  final String? actionButtonText;

  const SubChapterModel({
    required this.number,
    required this.title,
    this.subtitle,
    this.isLocked = false,
    this.isExpanded = false,
    required this.iconData,
    required this.iconColor,
    required this.borderColor,
    this.actionButtonText,
  });
}
