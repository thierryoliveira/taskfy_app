import 'package:todo_app/data/model/enums/task-status.enum.dart';

class AccessTokenModel {
  String accessToken;

  AccessTokenModel();


  AccessTokenModel.fromJson(Map<String, dynamic> json){
      this.accessToken = json['accessToken'];
      
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }

}