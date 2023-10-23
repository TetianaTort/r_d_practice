import 'dart:async';
import 'package:r_d_practice/todo_app/data/mock_api.dart';
import 'package:r_d_practice/todo_app/models/models.dart';

class TodoController {
  TodoController() {
    getTasks();
  }
  MockAPI api = MockAPI();
  List<Task> tasks = [];
  StreamController<List<Task>> listStreamController = StreamController<List<Task>>();

  Future<List<Task>> getTasks() async {
    tasks = await api.getTasks();
    listStreamController.sink.add(tasks);
    return tasks;
  }

  Future<List<Task>> addTask(Task task) async {
    await api.addTask(task);
    await getTasks();
    listStreamController.sink.add(tasks);
    return tasks;
  }

  Future<List<Task>> editTask(Task task) async {
    await api.editTask(task);
    await getTasks();
    return tasks;
  }

  Future<List<Task>> deleteTask(taskId) async {
    await api.deleteTask(taskId);
    await getTasks();
    return tasks;
  }
}
