import 'package:flutter/material.dart';
import 'package:project/db/model/data_model.dart';
import 'package:project/screen/subscreen/student_list.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my app',
      home: const StudentList(),
      theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Color.fromARGB(255, 158, 158, 167))),
      debugShowCheckedModeBanner: false,
    );
  }
}