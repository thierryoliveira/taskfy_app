import 'package:todo_app/app/data/model/auth/access_token_model.dart';
import 'package:todo_app/app/data/providers/auth/auth_provider.dart';

class AuthRepository {

final AuthApiClient apiClient = AuthApiClient();


  Future<AccessTokenModel> signIn(String username, String password) async {
    return apiClient.signIn(username, password);
  }
  
  Future<bool> signUp(String username, String password) async {
    return apiClient.signUp(username, password);
  }
}