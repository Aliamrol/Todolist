import 'package:flutter/material.dart';
import 'package:task_manager/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Tasko',
        theme: ThemeData(fontFamily: "nas"),
        home: Scaffold(
          body: HomeScreen(),
        ));
  }
}
