import 'package:meta/meta.dart';
import 'package:todo_app/data/model/access_token_model.dart';
import 'package:todo_app/data/providers/auth_api.dart';

class LoginRepository {

final AuthApiClient apiClient = AuthApiClient();


  Future<AccessTokenModel> signIn(String username, String password) async {
    return apiClient.signIn(username, password);
  }
}