import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/src/core/utils/string_extension.dart';
import 'package:to_do_list/src/data/datasources/local/local_data_sources.dart';
import 'package:to_do_list/src/data/db/db_connection.dart';
import 'package:to_do_list/src/data/repositories/task_repository.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/domain/repositories/task_repository.dart';
import 'package:to_do_list/src/domain/usecases/task.dart';

class TaskController extends GetxController {
  final LocalDataSources _localDataSources =
      LocalDataSourcesImpl(instance: dbInstance);
  late final DomainTaskRepository _domainTaskRepository;
  late final TaskUseCase _useCase;

  // expansion tile controllers
  ExpansionTileController upcomingToDoExpansionController =
      ExpansionTileController();

  ExpansionTileController dueToDoExpansionController =
      ExpansionTileController();

  // form controllers

  TextEditingController descriptionController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  // instance for edit
  Rx<Task> currentTask = Task.empty().obs;

  // list of task
  RxList<Task> tasks = <Task>[].obs;

  // loadings
  var loadingFormButton = false.obs;
  var loadingListOfTask = false.obs;

  @override
  void onInit() {
    super.onInit();
    _domainTaskRepository = DataTaskRepository(_localDataSources, dbInstance);
    _useCase = TaskUseCase(_domainTaskRepository);
  }

  Future<void> createTask() async {
    loadingFormButton.value = true;
    Task task = Task(
      description: descriptionController.text,
      scheduledDay: dateController.text.toDateTime() ?? DateTime.now(),
      isComplete: false,
    );

    Task? result = await _useCase.create(task);

    loadingFormButton.value = false;

    if (result != null) {
      tasks.add(result);
      clearForm();
      Get.back();
      Get.showSnackbar(snackBar(title: 'It has been created successfully'));
    } else {
      Get.back();
      Get.showSnackbar(snackBar(title: 'Could not create task'));
    }
  }

  Future<void> getAllTask() async {
    loadingListOfTask.value = true;

    List<Task> result = await _useCase.getAll();
    tasks.value = result;
  }

  Future<void> deleteTask(int id) async {
    loadingListOfTask.value = true;

    bool result = await _useCase.delete(id);

    if (result) {
      tasks.removeAt(tasks.indexWhere((element) => element.id == id));
      Get.showSnackbar(snackBar(title: 'The task was deleted'));
    } else {
      Get.showSnackbar(snackBar(title: 'Could not delete task'));
    }

  }

  Future<void> editTask() async {
    loadingFormButton.value = true;
    Task task = Task(
      id: currentTask.value.id,
      description: descriptionController.text,
      scheduledDay: dateController.text.toDateTime() ?? currentTask.value.scheduledDay,
      isComplete: currentTask.value.isComplete,
    );

    Task? result = await _useCase.update(task);

    loadingFormButton.value = false;

    if (result != null) {
      // remove old task
      tasks.removeAt(tasks.indexWhere((element) => element.id == currentTask.value.id));
      // add updated task
      tasks.add(result);
      clearForm();
      Get.back();
      Get.showSnackbar(snackBar(title: 'Task has been updated'));
    } else {
      Get.back();
      Get.showSnackbar(snackBar(title: 'Could not update task'));
    }
  }

  Future<void> markCompleted() async {
    loadingFormButton.value = true;
    Task task = Task(
      id: currentTask.value.id,
      description: currentTask.value.description,
      scheduledDay: currentTask.value.scheduledDay,
      isComplete: true,
    );

    Task? result = await _useCase.update(task);

    loadingFormButton.value = false;

    if (result != null) {
      // remove old task
      tasks.removeAt(tasks.indexWhere((element) => element.id == currentTask.value.id));
      // add updated task
      tasks.add(result);
      clearForm();
      Get.back();
      Get.showSnackbar(snackBar(title: 'Task has been updated'));
    } else {
      Get.back();
      Get.showSnackbar(snackBar(title: 'Could not update task'));
    }
  }


  void setData() {
    descriptionController.text = currentTask.value.description;
    dateController.text = currentTask.value.scheduledDay.toString().split(' ').first;
  }
  
  GetSnackBar snackBar({required String title}) {
    return  GetSnackBar(
      message: title,
      duration: const Duration(seconds: 3),
    );
  }

  void clearForm() {
    descriptionController.text = '';
    dateController.text = '';
  }
}
