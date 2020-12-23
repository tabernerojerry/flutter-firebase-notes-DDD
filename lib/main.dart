import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd/injection.dart';
import 'package:notes_firebase_ddd/presentation/core/app_widget.dart';

Future<void> main() async {
  // Need explicit binding before firebase call
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase to work
  await Firebase.initializeApp();
  // Inject Dependencies
  configureInjection(Environment.prod);
  // Run App
  runApp(AppWidget());
}
