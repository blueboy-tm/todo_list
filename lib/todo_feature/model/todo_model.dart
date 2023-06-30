import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:todo_list/tools/utils.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  TodoModel({
    id,
    required this.title,
    required this.description,
    submitDate,
    required this.goalDate,
    this.isDone = false,
  }) {
    this.id = id ?? const Uuid().v1();
    this.submitDate = submitDate ?? jalaliNow();
  }

  @HiveField(0)
  late final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  late final String submitDate;
  @HiveField(4)
  final String goalDate;
  @HiveField(5)
  final bool isDone;

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    String? submitDate,
    String? goalDate,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      submitDate: submitDate ?? this.submitDate,
      goalDate: goalDate ?? this.goalDate,
      isDone: isDone ?? this.isDone,
    );
  }

  static Jalali dateToJalali(String date) {
    var splited = date.split('/');
    return Jalali(
        int.parse(splited[0]), int.parse(splited[1]), int.parse(splited[2]));
  }

  static String jalaliToString(Jalali jalali) {
    return '${jalali.year}/${jalali.month}/${jalali.day}';
  }
}
