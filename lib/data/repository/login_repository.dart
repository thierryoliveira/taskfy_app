import 'package:meta/meta.dart';
import 'package:todo_app/data/model/access_token_model.dart';
import 'package:todo_app/data/providers/api.dart';

class LoginRepository {

final ApiClient apiClient;

LoginRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<AccessTokenModel> signIn(String username, String password) async {
    return apiClient.signIn(username, password);
  }

// getAll(){
//   return apiClient.getAll();
// }
// getId(id){
//   return apiClient.getId(id);
// }
// delete(id){
//   return apiClient.delete(id);
// }
// edit(obj){
//   return apiClient.edit( obj );
// }
// add(obj){
//     return apiClient.add( obj );
// }

}