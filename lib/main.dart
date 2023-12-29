import 'package:flutter/material.dart';
import 'package:task_manager/Screens/HomeScreen.dart';

import 'Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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









