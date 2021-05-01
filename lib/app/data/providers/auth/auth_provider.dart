import 'dart:convert';
// import 'package:getx_pattern/app/data/model/model.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/app/data/model/auth/access_token_model.dart';

const baseUrl = 'http://192.168.1.17:3000';

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

  Future<bool> signUp(String username, String password) async {
    bool _success = false;
    dio.options.contentType = Headers.jsonContentType;
    try {
      var response = await dio.post(baseUrl + '/auth/signup/',
          data: jsonEncode({'username': username, 'password': password}),
          options: Options(contentType: Headers.jsonContentType));
      if (response.statusCode.toString() == '201') {
        _success = true;
      }
    } catch (e) {
      print(e);
    }
    return _success;
  }

}