import 'dart:convert';
// import 'package:getx_pattern/app/data/model/model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/model/access_token_model.dart';
import 'package:todo_app/data/model/task_model.dart';

const baseUrl = 'http://192.168.1.7:3000';

class ApiClient {

final Dio dio;
ApiClient({@required this.dio});


  Future<AccessTokenModel> signIn(String username, String password) async {
    AccessTokenModel token = AccessTokenModel();
    dio.options.contentType = Headers.jsonContentType;
    try {
      var response = await dio.post(baseUrl + '/auth/signin/', data: jsonEncode({'username': username, 'password': password}), 
      options: Options(contentType:Headers.jsonContentType ));
      if(response.data != null){
          token = AccessTokenModel.fromJson(response.data);
      }
    } catch (e) {      
    }
    return token;
  }

 getAll() async {
  try {
    var response = await dio.get(baseUrl + '/tasks/');
    if(response.statusCode == 200){
      Iterable jsonResponse = json.decode(response.data);
        List<TaskModel> listMyModel = jsonResponse.map((model) => TaskModel.fromJson(model)).toList();
      return listMyModel;
    }else print ('erro');
  } catch(_){ }
}

// getId(id) async {
//   try {
//       var response = await httpClient.get('baseUrlid');
//     if(response.statusCode == 200){
//       //Map<String, dynamic> jsonResponse = json.decode(response.body);
//     }else print ('erro -get');
//   } catch(_){ }
// }

}