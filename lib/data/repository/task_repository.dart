import 'package:meta/meta.dart';
import 'package:todo_app/data/providers/auth_api.dart';

class TaskRepository {

  final AuthApiClient apiClient = AuthApiClient();

  getAll(String token) async {
    var tasks = await apiClient.getAll(token);
    return tasks;
  }
}
