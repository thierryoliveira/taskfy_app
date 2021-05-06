import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/task_interface.dart';
import 'package:todo_app/app/data/model/task/dto/create_task_dto.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/global/models/base_result_model.dart';

const baseUrl = 'http://192.168.1.17:3000';

class TaskProvider implements TaskInterface {

final Dio dio = Dio();

getAll(String token) async {
    try {
      dio.options.headers['Authorization'] = 'bearer ' + token;
      var response = await dio.get(baseUrl + '/tasks/');
        return (response.data as List)
          .map((x) => Task.fromJson(x))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  Future<Task> createTask(CreateTaskDTO task, String token) async {
    Task result = Task();
    try {
      dio.options.headers['Authorization'] = 'bearer ' + token;
      var response = await dio.post(baseUrl + '/tasks/', data: jsonEncode(task));
      result = Task.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<BaseResult<bool>> deleteTask(int taskId, String token) async {
    BaseResult<bool> result = BaseResult<bool>();
    try {
      dio.options.headers['Authorization'] = 'bearer ' + token;
      var response = await dio.delete("$baseUrl/tasks/$taskId");
      if(response.statusCode.toString() == '200'){
        result.success = true;
        result.data = true; 
      }     
    } catch (e) {
      result.message = e;
      print(e);
    }
    return result;
  }

}