import 'package:flutter/material.dart';

class HomeworkItemModel {
  final String id;
  final String subjectName;
  final String teacherName;
  final String title;
  final String description;
  final String deadlineText;
  final IconData icon;
  final Color iconBgColor;
  final Color subjectTextColor;
  bool isRead;
  bool isCompleted;

  HomeworkItemModel({
    required this.id,
    required this.subjectName,
    required this.teacherName,
    required this.title,
    required this.description,
    required this.deadlineText,
    required this.icon,
    required this.iconBgColor,
    required this.subjectTextColor,
    this.isRead = false,
    this.isCompleted = false,
  });
}
