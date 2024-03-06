import 'package:hive/hive.dart';
 part 'data_model.g.dart';


@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final int age;

  @HiveField(3)
  final int phone;

  @HiveField(4)
  final String place;

  @HiveField(5)
  final String? image;

  StudentModel(
      {required this.name,
      required this.age,
      required this.phone,
      required this.place,
      this.id,
      this.image});
}