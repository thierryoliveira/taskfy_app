import 'package:meta/meta.dart';
import 'package:todo_app/data/providers/auth_provider.dart';
import 'package:todo_app/data/providers/task_provider.dart';

class TaskRepository {

  final TaskProvider taskClient = TaskProvider();

  getAll(String token) async {
    var tasks = await taskClient.getAll(token);
    return tasks;
  }
}
