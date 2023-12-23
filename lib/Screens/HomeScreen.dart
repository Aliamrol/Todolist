import 'package:flutter/material.dart';
import 'package:task_manager/taskItem.dart';

import '../Task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Task> tasks = [
    Task(title: "Meet Maghsoud", id: DateTime.now().microsecondsSinceEpoch)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO DO LIST",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.grey[400],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) => TaskItem(
                        title: tasks[index].title,
                        isDone: tasks[index].isDone,
                        description: tasks[index].description,
                      ))),
        ],
      ),
    );
  }
}
