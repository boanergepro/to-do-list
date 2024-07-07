import 'package:get/get.dart';
import 'package:to_do_list/src/presentation/controllers/task_controller.dart';

T getOrPut<T>(T Function() putIfNotFound) {
  try {
    return Get.find<T>();
  } catch (e) {
    return Get.put<T>(putIfNotFound());
  }
}

TaskController get taskController => getOrPut(() => TaskController());