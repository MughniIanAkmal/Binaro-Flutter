import 'package:flutter/material.dart';

class ScheduleItem {
  final String subject;
  final String time;
  final IconData icon;
  final bool orange;

  const ScheduleItem({
    required this.subject,
    required this.time,
    required this.icon,
    required this.orange,
  });
}

List<ScheduleItem> scheduleForDay(int day) {
  if (day == 0) {
    return const [
      ScheduleItem(
        subject: 'Matematika',
        time: '07.30 - 09.00',
        icon: Icons.calculate_outlined,
        orange: true,
      ),
      ScheduleItem(
        subject: 'Ilmu Pengetahuan Alam',
        time: '09.15 - 10.45',
        icon: Icons.biotech_outlined,
        orange: false,
      ),
      ScheduleItem(
        subject: 'Bahasa Indonesia',
        time: '11.00 - 12.15',
        icon: Icons.book_outlined,
        orange: false,
      ),
      ScheduleItem(
        subject: 'Seni & Prakarya',
        time: '12.30 - 13.15',
        icon: Icons.palette_outlined,
        orange: true,
      ),
    ];
  }

  final dayName = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'][day];

  return [
    ScheduleItem(
      subject: 'Belum ada jadwal',
      time: '$dayName • Jadwal akan ditambahkan',
      icon: Icons.event_available_outlined,
      orange: day.isEven,
    ),
  ];
}
