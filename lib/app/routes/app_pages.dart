import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/views/tasks_page.dart';
import 'package:todo_app/app/modules/initial/bindings/initial_binding.dart';
import 'package:todo_app/app/modules/login/bindings/login_binding.dart';
import 'package:todo_app/app/modules/task/bindings/task_binding.dart';
import 'package:todo_app/app/routes/app_routes.dart';
import 'package:todo_app/app/modules/initial/views/initial_view.dart';
import 'package:todo_app/app/modules/login/views/login_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(), //InitialView(),
      binding: InitialBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(), //InitialView(),
      binding: LoginBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.TASKS, 
      page: () => TasksPage(), 
      binding: TaskBinding()),
  ];
}