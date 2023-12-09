import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class taskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => taskScreenState();
}

class taskScreenState extends State<taskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Write your task details"),

        ],
      ),
      appBar: AppBar(
        title: Text(
          "Subject",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_return),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
