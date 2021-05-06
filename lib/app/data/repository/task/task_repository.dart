
import 'package:todo_app/app/data/interfaces/task_interface.dart';
import 'package:todo_app/app/data/model/task/dto/create_task_dto.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/data/providers/task/task_provider.dart';
import 'package:todo_app/app/global/models/base_result_model.dart';

class TaskRepository implements TaskInterface {

  final TaskProvider taskClient = TaskProvider();

  getAll(String token) async {
    var tasks = await taskClient.getAll(token);
    return tasks;
  }

  Future<Task> createTask(CreateTaskDTO task, String token) async {
    var response = await taskClient.createTask(task, token);
    return response;
  }

  Future<BaseResult<bool>> deleteTask(int taskId, String token) async {
    var response = await taskClient.deleteTask(taskId, token);
    return response;
  }
}
