import 'package:flutter/material.dart';
import 'package:invogram/screens/login/login_form.dart';

/// TODO: implement this
class LoginLayout extends StatelessWidget {
  const LoginLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Text(
            'Welcome to Invogram',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: LoginForm(),
      ),
    );
  }
}
