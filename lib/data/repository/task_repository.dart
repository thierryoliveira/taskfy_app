import 'package:meta/meta.dart';
import 'package:todo_app/data/providers/api.dart';

class TaskRepository {
  final ApiClient apiClient;

  TaskRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll(String token) async {
    var tasks = await apiClient.getAll(token);
    return tasks;
  }
}
