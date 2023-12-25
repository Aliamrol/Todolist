import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Task.dart';

class newTaskScreen extends StatefulWidget {
  late Function AddNewTask;

  newTaskScreen({required this.AddNewTask});

  @override
  State<StatefulWidget> createState() => _newTaskScreen();
}

class _newTaskScreen extends State<newTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title_ = "";
    String description_ = "";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(hintText: "enter title: "),
              controller: _controller,
              onSubmitted: (value) {
                title_ = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(hintText: "enter title: "),
              controller: _controller,
              onSubmitted: (value) {
                description_ = value;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.done),
        onPressed: () {
          if (title_ != "") {
            Task task = Task(
                title: title_,
                id: DateTime.now().microsecondsSinceEpoch,
                description: description_);
            widget.AddNewTask(task);
          }
        },
      ),
    );
  }
}
