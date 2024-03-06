import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async{
  final hivebox = await Hive.openBox<StudentModel>('studentList');
  await hivebox.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  getAllStudent();
}

Future<void>getAllStudent()async{
  final hivebox=await Hive.openBox<StudentModel>('studentList');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(hivebox.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int index) async{
  final hivebox =await Hive.openBox<StudentModel>('studentList');
  await hivebox.deleteAt(index);
  studentListNotifier.notifyListeners();
  getAllStudent();
}

Future<void> editstudent(index, StudentModel value)async {
  final studentDB =await Hive.openBox<StudentModel>('studentList');
  studentListNotifier.notifyListeners();
  studentDB.putAt(index, value);
  getAllStudent();
}