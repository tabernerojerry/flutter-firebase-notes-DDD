import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notes App'),
        ),
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
