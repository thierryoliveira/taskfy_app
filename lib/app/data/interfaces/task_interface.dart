import 'package:todo_app/app/data/model/task/dto/create_task_dto.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/data/model/task/task_status_model.dart';
import 'package:todo_app/app/global/models/base_result_model.dart';

abstract class TaskInterface {
  getAll(String token);
  Future<Task> createTask(CreateTaskDTO task, String token);
  Future<BaseResult<bool>> deleteTask(int taskId, String token);
  Future<BaseResult<bool>> updateTaskStatus(TaskStatusModel status, String token);
}