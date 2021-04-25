
import 'package:todo_app/app/data/providers/task/task_provider.dart';

class TaskRepository {

  final TaskProvider taskClient = TaskProvider();

  getAll(String token) async {
    var tasks = await taskClient.getAll(token);
    return tasks;
  }
}
