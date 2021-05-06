import 'package:todo_app/app/data/model/enums/task-status.enum.dart';

class TaskStatusModel {
  int id;
  TaskStatus status;

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };

  TaskStatusModel(int _id, TaskStatus _status){
    this.id = _id;
    this.status = _status;
  }
}
