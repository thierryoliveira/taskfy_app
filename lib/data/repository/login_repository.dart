import 'package:meta/meta.dart';
import 'package:todo_app/data/model/access_token_model.dart';
import 'package:todo_app/data/providers/api.dart';

class LoginRepository {

final ApiClient apiClient;

LoginRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<AccessTokenModel> signIn(String username, String password) async {
    return apiClient.signIn(username, password);
  }
}