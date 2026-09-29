import 'package:flutter/material.dart';

class Assignment {
  final String subject;
  final String title;
  final String deadline;
  final IconData icon;
  final bool orangeBar;

  const Assignment({
    required this.subject,
    required this.title,
    required this.deadline,
    required this.icon,
    required this.orangeBar,
  });
}

const assignments = [
  Assignment(
    subject: 'IPA',
    title: 'Menanam Biji Kacang Hijau',
    deadline: 'Tenggat: Besok, 07:00 WIB',
    icon: Icons.local_florist_outlined,
    orangeBar: false,
  ),
  Assignment(
    subject: 'BHS. INDONESIA',
    title: 'Meringkas Dongeng Kancil',
    deadline: 'Tenggat: Rabu, 09:00 WIB',
    icon: Icons.book_outlined,
    orangeBar: true,
  ),
  Assignment(
    subject: 'MATEMATIKA',
    title: 'Membandingkan Pecahan',
    deadline: 'Tenggat: Kamis, 10:00 WIB',
    icon: Icons.calculate_outlined,
    orangeBar: false,
  ),
];
