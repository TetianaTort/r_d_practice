import 'package:flutter/material.dart';
import 'package:r_d_practice/todo_app/controller/todo_controller.dart';
import 'package:r_d_practice/todo_app/models/models.dart';
import 'package:r_d_practice/todo_app/task_screen.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  final controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo'),
      ),
      body: StreamBuilder<List<Task>>(
        stream: controller.listStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Task task = snapshot.data![index];

                return ListTile(
                  tileColor: task.isUrgent ? Colors.red[200] : Colors.green[100],
                  title: Text(task.title ?? 'Title'),
                  subtitle: Text(task.description ?? 'Description'),
                  trailing: Text(
                    switch (task.status) {
                      Status.pending => 'Pending',
                      Status.inProgress => 'In Progress',
                      Status.completed => 'Completed'
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TaskScreen(
                          task: task,
                          controller: controller,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      //FutureBuilder
      // body: FutureBuilder(
      //   future: controller.getTasks(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) {
      //           Task task = snapshot.data![index];

      //           return ListTile(
      //             tileColor: task.isUrgent ? Colors.red[200] : Colors.green[100],
      //             title: Text(task.title ?? 'Title'),
      //             subtitle: Text(task.description ?? 'Description'),
      //             trailing: Text(
      //               switch (task.status) {
      //                 Status.pending => 'Pending',
      //                 Status.inProgress => 'In Progress',
      //                 Status.completed => 'Completed'
      //               },
      //             ),
      //             onTap: () {
      //               Navigator.of(context).push(
      //                 MaterialPageRoute(
      //                   builder: (context) => TaskScreen(
      //                     task: task,
      //                     controller: controller,
      //                   ),
      //                 ),
      //               );
      //             },
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskScreen(
                task: null,
                controller: controller,
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Розробити додаток-менеджер завдань, який використовує асинхронність, потоки даних та паралельні обчислення.
// Додаток дозволяє користувачеві додавати, редагувати та видаляти завдання. Кожне завдання може мати статус (наприклад, "В очікуванні", "Виконується", "Завершено").

// ?Необхідний функціонал:

//? MockAPI - використовуйте як джерело даних, без інтернет зʼєднання, для простоти виконання задачі.
// ? Модифікуйте MockAPI та розширте його функціонал, додаючи більше даних та інші методи, за потреби.
//? Ініціалізуйте список завдань асинхронно використовуючи `async` та `await`.
//? При додаванні нового завдання використовуйте `Future` для збереження його у локальному сховищі (List<Task>, Map<Key, Task>).
//? Використовуйте `FutureBuilder` для відображення списку завдань.


// (Опційно) Створіть потік, який відстежує зміни статусів завдань у реальному часі.
//? (Опційно) Використовуйте `StreamBuilder` для відображення оновлених завдань.
// (Опційно) Для обчислення кількості завдань з певним статусом використовуйте паралельний потік через виклик методу `compute`.
// (Опційно) Для наповнення та відображення змін у списку - використовуйте анімації з попереднього уроку.


