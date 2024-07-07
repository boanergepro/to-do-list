import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/src/core/globals/quick_access_controllers.dart';
import 'package:to_do_list/src/presentation/screens/home_screen.dart';

class AppRoutes {
  static const home = '/';

  static final routes = [
    GetPage(
      name: home,
      page: () {
        taskController.getAllTask();
        return HomeScreen();
      },

    ),
  ];
}
