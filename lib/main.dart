import 'package:flutter/material.dart';
import 'package:task_manager/Screens/HomeScreen.dart';

import 'Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // AddFromTasksDoneToTask(int id) {
  //   Task t = Task(title: "BUG", id: 0000);
  //   for (int index = 0; index < tasksDone.length; index++) {
  //     if (tasksDone[index].id == id) {
  //       t = tasksDone[index];
  //     }
  //   }
  //   t.isDone = false;
  //   tasksDone.removeWhere((element) => element.id == id);
  //   tasks.add(t);
  // }

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
            child: HomeScreen(),
          ),
        ));
  }
}
