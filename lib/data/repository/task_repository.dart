import 'package:meta/meta.dart';
import 'package:todo_app/data/providers/api.dart';

class TaskRepository {

final ApiClient apiClient;

TaskRepository({@required this.apiClient}) : assert(apiClient != null);

getAll() async {
  return apiClient.getAll();
}
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