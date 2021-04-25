import 'package:todo_app/app/data/model/login/providers/task_provider.dart';

class TaskRepository {

  final TaskProvider taskClient = TaskProvider();

  getAll(String token) async {
    var tasks = await taskClient.getAll(token);
    return tasks;
  }
}
