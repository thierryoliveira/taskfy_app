import 'dart:convert';
// import 'package:getx_pattern/app/data/model/model.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/app/data/model/auth/access_token_model.dart';
import 'package:todo_app/app/global/api.dart';
import 'package:todo_app/app/global/models/base_result_model.dart';

class AuthApiClient {
  final Dio dio = Dio();

  Future<BaseResult<AccessTokenModel>> signIn(
      String username, String password) async {
    BaseResult<AccessTokenModel> result = BaseResult<AccessTokenModel>();
    AccessTokenModel token = AccessTokenModel();
    dio.options.contentType = Headers.jsonContentType;
    try {
      var response = await dio.post(BASE_URL + '/auth/signin/',
          data: jsonEncode({'username': username, 'password': password}),
          options: Options(contentType: Headers.jsonContentType));
      if (response.data != null) {
        token = AccessTokenModel.fromJson(response.data);
        result.data = token;
        result.success = true;
      }
    } on DioError catch (e) {
      result.message = e.response.data['message'];
    }
    return result;
  }

  Future<BaseResult<bool>> signUp(String username, String password) async {
    BaseResult<bool> result = BaseResult<bool>();
    dio.options.contentType = Headers.jsonContentType;
    try {
      var response = await dio.post(BASE_URL + '/auth/signup/',
          data: jsonEncode({'username': username, 'password': password}),
          options: Options(contentType: Headers.jsonContentType));
      if (response.statusCode.toString() == '201') {
        result.data = true;
        result.success = true;
      }
    } on DioError catch (e) {
      result.message = e.response.data['message'];
    }
    return result;
  }
}
