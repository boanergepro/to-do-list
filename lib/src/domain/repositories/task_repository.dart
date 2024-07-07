import 'package:to_do_list/src/domain/entities/task.dart';

abstract class DomainTaskRepository {
  Future<Task?> createTask(Task task);

  Future<Task?> updateTask(Task task);

  Future<bool> deleteTask(int id);

  Future<List<Task>> getAllTask();
}