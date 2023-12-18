import 'package:flutter/material.dart';
import 'package:task_manager/AddNewTodo.dart';
import 'package:task_manager/Todo.dart';
import 'package:task_manager/WidgetTodo.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  List<Todo> todos = [];

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
                        Navigator.pop(context);
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
                TextField(
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
                // list of toDo
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) => TodoWidget(
                        title: todos[index].title, isdone: todos[index].isdone),
                  ),
                )),
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Expanded(
                        child: AddNewTodo(
                      AddTodo: AddTodo,
                    ))
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
