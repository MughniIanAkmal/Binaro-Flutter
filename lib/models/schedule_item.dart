import 'package:flutter/material.dart';

class ScheduleItem {
  final String subject;
  final String time;
  final IconData icon;
  final bool orange;
  final String teacher;
  final String room;

  const ScheduleItem({
    required this.subject,
    required this.time,
    required this.icon,
    required this.orange,
    this.teacher = 'Guru Mata Pelajaran',
    this.room = 'Ruang 4B',
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
        teacher: 'Ibu Sarah Wijaya, S.Pd.',
        room: 'Ruang 4B',
      ),
      ScheduleItem(
        subject: 'Ilmu Pengetahuan Alam',
        time: '09.15 - 10.45',
        icon: Icons.biotech_outlined,
        orange: false,
        teacher: 'Bpk. Ahmad Fauzi, M.Pd.',
        room: 'Lab IPA',
      ),
      ScheduleItem(
        subject: 'Bahasa Indonesia',
        time: '11.00 - 12.15',
        icon: Icons.book_outlined,
        orange: false,
        teacher: 'Ibu Rina Kartika, S.Pd.',
        room: 'Ruang 4B',
      ),
      ScheduleItem(
        subject: 'Seni & Prakarya',
        time: '12.30 - 13.15',
        icon: Icons.palette_outlined,
        orange: true,
        teacher: 'Bpk. Hendra Gunawan, S.Sn.',
        room: 'Ruang Seni',
      ),
    ];
  } else if (day == 1) {
    return const [
      ScheduleItem(
        subject: 'Pendidikan Pancasila (PPKn)',
        time: '07.30 - 09.00',
        icon: Icons.shield_outlined,
        orange: true,
        teacher: 'Ibu Endah Lestari, S.Pd.',
        room: 'Ruang 4B',
      ),
      ScheduleItem(
        subject: 'Bahasa Inggris',
        time: '09.15 - 10.45',
        icon: Icons.translate_rounded,
        orange: false,
        teacher: 'Miss Jessica Miller, B.Ed.',
        room: 'Lab Bahasa',
      ),
      ScheduleItem(
        subject: 'PJOK / Olahraga',
        time: '11.00 - 12.15',
        icon: Icons.sports_basketball_outlined,
        orange: false,
        teacher: 'Bpk. Dedi Supriyadi, S.Pd.',
        room: 'Lapangan',
      ),
    ];
  } else if (day == 2) {
    return const [
      ScheduleItem(
        subject: 'Matematika',
        time: '07.30 - 09.00',
        icon: Icons.calculate_outlined,
        orange: true,
        teacher: 'Ibu Sarah Wijaya, S.Pd.',
        room: 'Ruang 4B',
      ),
      ScheduleItem(
        subject: 'Ilmu Pengetahuan Sosial',
        time: '09.15 - 10.45',
        icon: Icons.public_outlined,
        orange: false,
        teacher: 'Bpk. Budi Hermanto, S.Pd.',
        room: 'Ruang 4B',
      ),
      ScheduleItem(
        subject: 'Pendidikan Agama & Budi Pekerti',
        time: '11.00 - 12.15',
        icon: Icons.menu_book_rounded,
        orange: false,
        teacher: 'Bpk. Ust. Syarifuddin, S.Ag.',
        room: 'Musholla',
      ),
    ];
  }

  final dayName = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'][day];

  return [
    ScheduleItem(
      subject: 'Jadwal $dayName',
      time: '07.30 - 11.30',
      icon: Icons.event_note_rounded,
      orange: day.isEven,
      teacher: 'Wali Kelas 4B',
      room: 'Ruang 4B',
    ),
  ];
}
