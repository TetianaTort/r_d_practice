import 'package:r_d_practice/todo_app/models/models.dart';

class MockAPI {
  List<Task> tasks = [
    Task(
      id: 1,
      title: "Вивчити Flutter",
      description: "Прочитати документацію",
    ),
    Task(
      id: 2,
      title: "Розробити додаток",
      description: "Використати Bloc",
      status: Status.inProgress,
    ),
    Task(
      id: 3,
      title: "Провести тестування",
      description: "Запитати відгуки у користувачів",
      isUrgent: true,
    ),
  ];

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 2));
    return tasks;
  }

  Future<List<Task>> addTask(Task task) async {
    tasks.add(task);
    return await getTasks();
  }

  Future<List<Task>> editTask(
    Task task,
  ) async {
    tasks.isNotEmpty ? tasks.removeWhere((element) => element.id == task.id) : null;
    tasks.add(task);

    return await getTasks();
  }

  deleteTask(int taskId) {
    var delete = tasks.firstWhere((element) => element.id == taskId);
    tasks.remove(delete);
  }
}
