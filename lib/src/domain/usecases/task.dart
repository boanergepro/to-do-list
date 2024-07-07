import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/domain/repositories/task_repository.dart';

class TaskUseCase {
  final DomainTaskRepository repository;

  const TaskUseCase(this.repository);

  Future<Task?> create(Task task) {
    return repository.createTask(task);
  }

  Future<Task?> update(Task task) {
    return repository.updateTask(task);
  }

  Future<bool> delete(int id) {
    return repository.deleteTask(id);
  }

  Future<List<Task>> getAll() {
    return repository.getAllTask();
  }
}