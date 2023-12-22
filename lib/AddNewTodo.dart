import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewTodo extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  final Function AddTodo;

  AddNewTodo({required this.AddTodo});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: (value) {
        if (true) {
          AddTodo(value);
          _controller.clear();
        }
      },
      decoration: InputDecoration(
          hintText: "کار جدید به لیست کارها اضافه کنید",
          border: InputBorder.none),
      style: TextStyle(color: Colors.blue, fontSize: 18),
    );
  }
}
