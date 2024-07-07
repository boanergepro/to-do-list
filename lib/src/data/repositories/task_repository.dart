import 'package:isar/isar.dart';
import 'package:to_do_list/src/data/datasources/local/local_data_sources.dart';
import 'package:to_do_list/src/data/models/task_model.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/domain/repositories/task_repository.dart';

class DataTaskRepository implements DomainTaskRepository {
  final LocalDataSources localDataSources;
  final Isar isar;

  DataTaskRepository(this.localDataSources, this.isar);

  @override
  Future<Task?> createTask(Task task) async {
    var taskModel = TaskModel.fromEntity(task);

    final response =
        await LocalDataSourcesImpl(instance: isar).createTask(taskModel);

    return response?.toEntity();
  }

  @override
  Future<bool> deleteTask(int id) async {
    bool success = false;

    success = await LocalDataSourcesImpl(instance: isar).deleteTask(id);
    return success;
  }

  @override
  Future<List<Task>> getAllTask() async {
    var tasks = await LocalDataSourcesImpl(instance: isar).getAllTask();

    if (tasks.isEmpty) return [];

    return tasks.map((e) => e.toEntity()).toList();
  }

  @override
  Future<Task?> updateTask(Task task) async{
    var taskModel = TaskModel.fromEntity(task);

    final response =
        await LocalDataSourcesImpl(instance: isar).updateTask(taskModel);

    return response?.toEntity();
  }
}
