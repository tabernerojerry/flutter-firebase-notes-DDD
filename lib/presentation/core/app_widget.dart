import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd/application/auth/auth_bloc.dart';
import 'package:notes_firebase_ddd/injection.dart';
import 'package:notes_firebase_ddd/presentation/routes/router.gr.dart';
import 'package:notes_firebase_ddd/presentation/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        builder: ExtendedNavigator.builder<AppRouter>(
          router: AppRouter(),
        ),
        // Need home to prevent Error (NoSuchMethodError was thrown building Builder)
        home: SplashPage(),
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          accentColor: Colors.blueAccent,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
