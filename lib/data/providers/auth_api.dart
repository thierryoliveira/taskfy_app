import 'dart:convert';
// import 'package:getx_pattern/app/data/model/model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/model/access_token_model.dart';
import 'package:todo_app/data/model/task_model.dart';

const baseUrl = 'http://192.168.1.11:3000';

class AuthApiClient {
  final Dio dio = Dio();

  Future<AccessTokenModel> signIn(String username, String password) async {
    AccessTokenModel token = AccessTokenModel();
    dio.options.contentType = Headers.jsonContentType;
    try {
      var response = await dio.post(baseUrl + '/auth/signin/',
          data: jsonEncode({'username': username, 'password': password}),
          options: Options(contentType: Headers.jsonContentType));
      if (response.data != null) {
        token = AccessTokenModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return token;
  }

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
