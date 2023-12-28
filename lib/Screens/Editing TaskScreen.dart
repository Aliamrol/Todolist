import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Task.dart';

class editinTaskScreen extends StatefulWidget {
  late String title;
  late String description;
  late int id;

  late Function editingTask;

  editinTaskScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.id,
      required this.editingTask});

  @override
  State<StatefulWidget> createState() => _editinTaskScreen();
}

class _editinTaskScreen extends State<editinTaskScreen> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @override
  void initState() {
    title_ = widget.title;
    description_ = widget.description;
    controllerTitle.text = widget.title;
    controllerDescription.text = widget.description;
  }

  String title_ = "";
  String description_ = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("EDITING TASK : ${widget.title}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: controllerTitle,
              decoration: InputDecoration(hintText: "enter title: "),
              onChanged: (value) {
                title_ = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: TextField(
              controller: controllerDescription,
              decoration: InputDecoration(hintText: "enter description: "),
              onChanged: (value) {
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
          setState(() {
            if (title_ != "") {
              Task task = Task(
                  title: title_,
                  id: DateTime.now().microsecondsSinceEpoch,
                  description: description_);
              widget.editingTask(widget.id, title_, description_);
              controllerTitle.clear();
              controllerTitle.clear();
              Navigator.pop(context);
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Please enter the title"),
                    );
                  });
            }
          });
        },
      ),
    );
  }
}
