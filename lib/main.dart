import 'package:flutter/material.dart';
import 'package:r_d_practice/todo_app/todo_home_screen.dart';
// import 'package:r_d_practice/recipes/recipes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter r_d course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoHomeScreen(),
    );
  }
}
