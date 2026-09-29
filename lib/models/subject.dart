import 'package:flutter/material.dart';

class Subject {
  final String name;
  final String chapter;
  final int done;
  final int total;
  final IconData icon;
  final bool orange;

  const Subject({
    required this.name,
    required this.chapter,
    required this.done,
    required this.total,
    required this.icon,
    required this.orange,
  });
}

const subjects = [
  Subject(
    name: 'Matematika',
    chapter: 'Bab 3',
    done: 14,
    total: 20,
    icon: Icons.calculate_outlined,
    orange: true,
  ),
  Subject(
    name: 'IPA',
    chapter: 'Bab 4',
    done: 10,
    total: 16,
    icon: Icons.biotech_outlined,
    orange: false,
  ),
  Subject(
    name: 'Bhs. Indonesia',
    chapter: 'Bab 2',
    done: 12,
    total: 15,
    icon: Icons.book_outlined,
    orange: false,
  ),
  Subject(
    name: 'Pancasila',
    chapter: 'Bab 2',
    done: 8,
    total: 12,
    icon: Icons.shield_outlined,
    orange: true,
  ),
];
