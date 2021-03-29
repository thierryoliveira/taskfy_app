import 'package:get/get.dart';
import 'package:todo_app/bindings/task_binding.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/ui/login/login_screen.dart';
import 'package:todo_app/ui/tasks/tasks_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => LoginScreen()),
    GetPage(name: Routes.TASKS, page: () => TasksScreen(), binding: TaskBinding()),
  ];
}