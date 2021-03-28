import 'package:todo_app/data/model/enums/task-status.enum.dart';

class TaskModel {
  int id;
  String title;
  String description;
  TaskStatus status;

  TaskModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.title = json['title'];
      this.description = json['description'];
      this.status = json['status'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.title;
    data['description'] = this.description;
    return data;
  }

}