import 'package:get/get.dart';
import 'package:todo_app/app/modules/auth/bindings/auth_binding.dart';
import 'package:todo_app/app/modules/auth/views/signin_view.dart';
import 'package:todo_app/app/modules/initial/bindings/initial_binding.dart';
import 'package:todo_app/app/modules/initial/views/initial_view.dart';
import 'package:todo_app/app/modules/auth/views/signup_view.dart';
import 'package:todo_app/app/modules/task/bindings/task_binding.dart';
import 'package:todo_app/app/modules/task/views/tasks_page.dart';
import 'package:todo_app/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(), //InitialView(),
      binding: InitialBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SignInPage(), //InitialView(),
      binding: AuthBinding(), //InitialBinding(),
    ),
    GetPage(
        name: Routes.TASKS, page: () => TasksPage(), binding: TaskBinding()),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
  ];
}
