import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd/injection.dart';

void main() {
  configureInjection(Environment.prod);
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
          title: const Text('Notes App'),
        ),
        body: const Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
