import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/model/task_model.dart';

const baseUrl = 'http://192.168.1.11:3000';

class TaskProvider {

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

}