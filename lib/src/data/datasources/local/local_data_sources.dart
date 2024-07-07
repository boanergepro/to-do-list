import 'package:isar/isar.dart';
import 'package:to_do_list/src/data/models/task_model.dart';

abstract class LocalDataSources {

  Future<TaskModel?> createTask(TaskModel taskModel);

  Future<TaskModel?> updateTask(TaskModel taskModel);

  Future<bool> deleteTask(int id);

  Future<List<TaskModel>> getAllTask();
}

class LocalDataSourcesImpl implements LocalDataSources {

  final Isar instance;

  LocalDataSourcesImpl({required this.instance});

  @override
  Future<TaskModel?> createTask(TaskModel taskModel) async {
    try {
      int id = 0;

      await instance.writeTxn(() async {
        id = await instance.taskModels.put(taskModel);
      });
      final task = getTaskById(id);
      return task;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<bool> deleteTask(int id) async {
    try {
      bool success = false;

      await instance.writeTxn(() async {
        final result = await instance.taskModels.delete(id);
        success = result ?? false;
      });

      return success;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<List<TaskModel>> getAllTask() async {
    try {
      List<TaskModel>? result = await instance.taskModels.where().findAll();

      // order result by data
      result.sort((a, b) => a.scheduledDay.compareTo(b.scheduledDay));

      return result ?? [];
    } catch (e) {
      print(e);
    }

    return [];
  }

  @override
  Future<TaskModel?> updateTask(TaskModel taskModel) async {
    try {
      int id = 0;

      await instance.writeTxn(() async {
        id = await instance.taskModels.put(taskModel);
      });
      final task = getTaskById(id);
      return task;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<TaskModel?> getTaskById(int id) async {
    try {
      final task = await instance.taskModels.where().idEqualTo(id).findFirst();
      return task;
    } catch (e) {
      print(e);
    }
    return null;
  }
}