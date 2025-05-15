import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert'; // For converting the student data to and from JSON
import 'student_model.dart';

class StudentProvider with ChangeNotifier {
  final LocalStorage storage;
  List<Student> _students = [];

  StudentProvider({required this.storage}) {
    _loadStudentsFromStorage();
  }

  List<Student> get students => _students;

  void _loadStudentsFromStorage() async {
    var data = storage.getItem('students');
    if (data != null) {
      _students = List<Student>.from(
        (jsonDecode(data) as List).map(
          (item) => Student.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void addStudent(Student student) {
    _students.add(student);
    _saveToStorage();
    notifyListeners();
  }

  void deleteStudent(int id) {
    _students.removeWhere((element) => element.id == id);
    _saveToStorage();
    notifyListeners();
  }

  void updateStudent(Student student) {
    var index = _students.indexWhere((element) => element.id == student.id);
    if (index != -1) {
      _students[index] = student;
      _saveToStorage();
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'students',
      jsonEncode(_students.map((student) => student.toMap()).toList()),
    );
  }
}
