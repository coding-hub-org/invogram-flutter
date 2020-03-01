import 'package:flutter/material.dart';
import 'package:invogram/screens/routes.dart';

class InvogramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invogram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.home.name: (context) => Routes.home.widget,
        Routes.reminder.name: (context) => Routes.reminder.widget,
        Routes.login.name: (context) => Routes.login.widget,
        Routes.signUp.name: (context) => Routes.signUp.widget,
      },
      home: Routes.reminder.widget,
    );
  }
}
