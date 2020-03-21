import 'package:flutter/material.dart';
import 'package:invogram/providers/authentication_state.dart';
import 'package:invogram/screens/login/login_layout.dart';

/// TODO: implement this
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String error = '', password, email;
  bool showPassword = false;
  bool loading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onChangePassword(String value) {
    setState(() {
      password = value.trim();
    });
  }

  onChangeEmail(String value) {
    setState(() {
      email = value.trim();
    });
  }

  onToggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  onClickSignInButton(context) async {
    setState(() {
      loading = true;
    });

    if (formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Logging In'),
        duration: Duration(minutes: 5),
      ));
      String userId = await AuthenticateState().signIn(email, password);
      Scaffold.of(context).hideCurrentSnackBar();
      if (userId == null) {
        setState(() {
          error = 'Wrong user or password';
        });
      } else {
        setState(() {
          error = '';
          loading = false;
        });
//        Navigator.pushNamed(context, Routes.reminder.name);
      }
    }
    setState(() {
      loading = false;
    });
  }

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
      body: Builder(
        builder: (BuildContext context) {
          return LoginLayout(
            error: error,
            formKey: formKey,
            loading: loading,
            showPassword: showPassword,
            onChangeEmail: onChangeEmail,
            onChangePassword: onChangePassword,
            onClickSignInButton: () {
              onClickSignInButton(context);
            },
            onToggleShowPassword: onToggleShowPassword,
          );
        },
      )
    );
  }
}

