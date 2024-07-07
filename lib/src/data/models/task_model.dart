import 'package:isar/isar.dart';
import 'package:to_do_list/src/domain/entities/task.dart';

part 'task_model.g.dart';

@collection
class TaskModel {
  Id id = Isar.autoIncrement;

  String description;

  DateTime scheduledDay = DateTime.now();

  bool isComplete = false;

  TaskModel({
    required this.id,
    required this.description,
    required this.scheduledDay,
    required this.isComplete,
  });

  factory TaskModel.fromEntity(Task task) => TaskModel(
        id: task.id ?? Isar.autoIncrement,
        description: task.description,
        scheduledDay: task.scheduledDay,
        isComplete: task.isComplete,
      );

  Task toEntity() => Task(
        id: id,
        description: description,
        scheduledDay: scheduledDay,
        isComplete: isComplete,
      );
}
