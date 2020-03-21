import 'package:flutter/material.dart';
import 'package:invogram/screens/login/input_fields.dart';

class LoginForm extends StatelessWidget {
  final String error;
  final bool showPassword;
  final bool loading;
  final GlobalKey<FormState> formKey;
  final Function(String) onChangePassword, onChangeEmail;
  final Function() onToggleShowPassword;
  final Function() onClickSignInButton;

  LoginForm({
    @required this.error,
    @required this.showPassword,
    @required this.loading,
    @required this.formKey,
    this.onChangePassword,
    this.onChangeEmail,
    this.onToggleShowPassword,
    this.onClickSignInButton,
  });

  Widget signInButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: SizedBox(
          height: 60,
          child: RaisedButton(
            elevation: 10,
            color: Colors.blue,
            onPressed: () {
              onClickSignInButton();
            },
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotPasswordButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'Forgot Password',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget errorMessage() {
    return Text(
      error == null ? '' : error,
      style: TextStyle(color: Colors.red),
    );
  }

  Widget signInFields() {
    return Column(
      children: <Widget>[
        EmailField(
          loading: loading,
          onChangeEmail: onChangeEmail,
        ),
        PasswordField(
          loading: loading,
          onChangePassword: onChangePassword,
          onToggleShowPassword: onToggleShowPassword,
          showPassword: showPassword,
        ),
        errorMessage(),
        signInButton(),
      ],
    );
  }

  Widget bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        signUpButton(),
        forgotPasswordButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              signInFields(),
              bottomButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
