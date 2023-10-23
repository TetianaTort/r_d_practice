import 'package:flutter/material.dart';
import 'dart:math';
import 'package:r_d_practice/todo_app/controller/todo_controller.dart';
import 'package:r_d_practice/todo_app/models/models.dart';
import 'package:r_d_practice/todo_app/widgets/custom_dropdown.dart';
import 'package:r_d_practice/todo_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class TaskScreen extends StatefulWidget {
  Task? task;
  final TodoController controller;
  TaskScreen({
    super.key,
    required this.task,
    required this.controller,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Task task;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.task != null) {
      task = widget.task!;
    } else {
      task = Task(
        id: null,
        title: null,
        description: null,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title ?? 'New Task'),
        actions: [
          task.id != null
              ? IconButton(
                  onPressed: () {
                    widget.controller.deleteTask(task.id);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete_outline),
                )
              : const SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CusomTextField(
                    value: task.title ?? '',
                    lable: 'Task name',
                    textInputAction: TextInputAction.next,
                    valueChanged: (String value) {
                      if (value.isNotEmpty) {
                        task.title = value;
                      }
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  CusomTextField(
                    value: task.description ?? '',
                    lable: 'Task description',
                    textInputAction: TextInputAction.next,
                    valueChanged: (String value) {
                      if (value.isNotEmpty) {
                        task.description = value;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Urgent',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 191, 121, 121),
                            fontWeight: FontWeight.bold),
                      ),
                      Switch.adaptive(
                          value: task.isUrgent,
                          onChanged: (value) {
                            setState(() {
                              task.isUrgent = value;
                            });
                          }),
                    ],
                  ),
                  CustomDropDownMenu(
                    value: task.status,
                    list: Status.values,
                    valueChanged: (value) {
                      task.status = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please choose the group or add new one';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 55),
                  ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        if (task.id == null) {
                          task.id = Random().nextInt(100);
                          widget.controller.addTask(task);
                        } else {
                          widget.controller.editTask(task);
                        }

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(task.id != null ? 'Edit' : 'Add event'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
