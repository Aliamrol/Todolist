import 'package:flutter/material.dart';
import 'package:task_manager/AddNewTodo.dart';
import 'package:task_manager/Todo.dart';
import 'package:task_manager/Widget/Task/taskItem.dart';
import 'package:task_manager/WidgetTodo.dart';

import 'Task.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key, this.task});

  Task? task;

  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  List<Todo> todos = [];
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptioController = TextEditingController();

  @override
  initState(){
    super.initState();
    if(widget.task != null){
      taskTitleController.text = widget.task?.title ?? "";
      taskDescriptioController.text = widget.task?.description ?? "";
    }
  }

  AddTodo(value) {
    setState(() {
      todos.add(Todo(title: value, isdone: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                // appBar ( back buttom and subject)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, widget.task);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: taskTitleController,
                          onSubmitted: (value) {
                            if (widget.task == null) {
                              setState(() {
                                widget.task = Task(
                                    title: value,
                                    id: DateTime.now().microsecondsSinceEpoch,
                                );
                              });
                            } else {
                              widget.task?.title = value;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "عنوان کار شما",
                              border: InputBorder.none),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ),
                    )
                  ],
                ),
                // textField for enter the tozih
                Visibility(
                  visible: widget.task != null,
                  child: TextField(
                    controller: taskDescriptioController,
                    onChanged: (value) {
                      widget.task?.description = value;
                    },
                    decoration: InputDecoration(
                        hintText: "توضیح کار خود را در اینجا وارد کنید",
                        border: InputBorder.none),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                    minLines: 1,
                    maxLines: 3,
                  ),
                ),
                // list of toDo
                Visibility(
                  visible: widget.task != null,
                  child: Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) => TodoWidget(
                          title: todos[index].title,
                          isdone: todos[index].isdone),
                    ),
                  )),
                ),
                Visibility(
                    visible: widget.task != null,
                    child: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          margin:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        Expanded(
                            child: AddNewTodo(
                          AddTodo: AddTodo,
                        ))
                      ],
                    ))
              ],
            ),
          ),
        )));
  }
}
