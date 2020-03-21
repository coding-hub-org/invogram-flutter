import 'package:flutter/material.dart';
import 'package:invogram/screens/login/login_form.dart';

/// TODO: implement this
class LoginLayout extends StatelessWidget {
  final String error;
  final bool showPassword;
  final bool loading;
  final GlobalKey<FormState> formKey;
  final Function(String) onChangePassword, onChangeEmail;
  final Function() onToggleShowPassword;
  final Function() onClickSignInButton;

  LoginLayout({
    @required this.error,
    @required this.showPassword,
    @required this.loading,
    @required this.formKey,
    this.onChangePassword,
    this.onChangeEmail,
    this.onToggleShowPassword,
    this.onClickSignInButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: LoginForm(
        error: error,
        formKey: formKey,
        loading: loading,
        showPassword: showPassword,
        onChangeEmail: onChangeEmail,
        onChangePassword: onChangePassword,
        onClickSignInButton: onClickSignInButton,
        onToggleShowPassword: onToggleShowPassword,
      ),
    );
  }
}
