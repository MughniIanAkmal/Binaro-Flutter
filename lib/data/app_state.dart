import 'package:flutter/material.dart';
import '../models/homework_model.dart';
import 'mock_data.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal() {
    _homeworkList = MockData.homeworkList;
  }

  late List<HomeworkItemModel> _homeworkList;
  List<HomeworkItemModel> get homeworkList => _homeworkList;

  int _currentNavIndex = 0; // 0: Beranda/Mapel, 1: Mapel, 2: Ujian, 3: Jadwal, 4: Profil
  int get currentNavIndex => _currentNavIndex;

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  int get unreadHomeworkCount =>
      _homeworkList.where((item) => !item.isRead).length;

  int get completedHomeworkCount =>
      _homeworkList.where((item) => item.isCompleted).length;

  void markAllHomeworkAsRead() {
    for (var item in _homeworkList) {
      item.isRead = true;
    }
    notifyListeners();
  }

  void toggleHomeworkCompleted(String id) {
    final item = _homeworkList.firstWhere((element) => element.id == id);
    item.isCompleted = !item.isCompleted;
    if (item.isCompleted) {
      item.isRead = true;
    }
    notifyListeners();
  }

  void markHomeworkAsRead(String id) {
    final item = _homeworkList.firstWhere((element) => element.id == id);
    item.isRead = true;
    notifyListeners();
  }
}
