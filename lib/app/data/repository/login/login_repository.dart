import 'package:todo_app/app/data/model/login/access_token_model.dart';
import 'package:todo_app/app/data/providers/login/auth_provider.dart';

class LoginRepository {

final AuthApiClient apiClient = AuthApiClient();


  Future<AccessTokenModel> signIn(String username, String password) async {
    return apiClient.signIn(username, password);
  }
}