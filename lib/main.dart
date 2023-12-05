import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasko',
      theme: ThemeData(
        fontFamily: "nas"
      ),
      home: Scaffold(
        body: Center(child: Text("سلام ایرانی", textScaleFactor: 10,),),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

