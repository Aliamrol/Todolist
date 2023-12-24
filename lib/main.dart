import 'package:flutter/material.dart';
import 'package:task_manager/Screens/HomeScreen.dart';

import 'Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Task> tasks = [
    Task(
      title: "Meet Bakhtiar",
      id: DateTime.now().microsecondsSinceEpoch,
    )
  ];
  List<Task> tasksDone = [
    Task(
        title: "meet maghsoud",
        id: DateTime.now().microsecondsSinceEpoch,
        isDone: true),
  ];

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasko',
        theme: ThemeData(
            // fontFamily: "nas",
            scaffoldBackgroundColor: Colors.grey[200]),
        home: Scaffold(
          body: SafeArea(
            child: HomeScreen(
              tasks: this.tasks,
              tasksDone: this.tasksDone,
            ),
          ),
        ));
  }
}
