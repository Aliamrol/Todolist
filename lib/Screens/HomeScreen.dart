import 'package:flutter/material.dart';

import '../Task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  List<Task> tasks = [];

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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
    );
  }
}
