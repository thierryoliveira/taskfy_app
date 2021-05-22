import 'package:todo_app/app/data/model/auth/access_token_model.dart';
import 'package:todo_app/app/data/providers/auth/auth_provider.dart';
import 'package:todo_app/app/global/models/base_result_model.dart';

class AuthRepository {

final AuthApiClient apiClient = AuthApiClient();


  Future<BaseResult<AccessTokenModel>> signIn(String username, String password) async {
      return apiClient.signIn(username, password);
  }
  
  Future<BaseResult<bool>> signUp(String username, String password) async {
    return apiClient.signUp(username, password);
  }
}