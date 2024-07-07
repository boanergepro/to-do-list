import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/src/presentation/widgets/bottom_sheet_form_widget.dart';
import 'package:to_do_list/src/presentation/widgets/expansion_section.dart';
import 'package:to_do_list/src/presentation/widgets/greeting_widget.dart';
import 'package:to_do_list/src/core/globals/quick_access_controllers.dart';
import 'package:to_do_list/src/presentation/widgets/item_task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Greeting
                  const GreetingWidget(),
                  // list of upcoming to-do's
                  ExpansionSection(
                    controller: taskController.upcomingToDoExpansionController,
                    initiallyExpanded: true,
                    title: 'Upcoming To-do\'s',
                    children: List.generate(
                      taskController.tasks.length,
                      (index) => ItemTaskWidget(
                        task: taskController.tasks[index],
                        markCompleted: () {
                          taskController.currentTask.value = taskController.tasks[index];
                          taskController.markCompleted();
                        },
                        deleteTask: () {
                          taskController
                              .deleteTask(taskController.tasks[index].id ?? 0);
                        },
                        editTask: () {
                          taskController.currentTask.value = taskController.tasks[index];
                          taskController.setData();
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: BottomSheetFormWidget(
                                    title: 'Edit the task',
                                    onPress: () async {
                                     await taskController.editTask();
                                    },
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: BottomSheetFormWidget(
                    title: 'Create a new task',
                    onPress: () async {
                      await taskController.createTask();
                    },
                  ),
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
