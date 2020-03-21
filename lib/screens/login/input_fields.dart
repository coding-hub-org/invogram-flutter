import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function(String) onChangeEmail;
  final bool loading;

  EmailField({
    @required this.onChangeEmail,
    @required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (String value) {
          bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
          if (isValid) {
            return value.isEmpty ? 'Email can\'t be empty' : null;
          } else {
            return 'Email is not valid';
          }
        },
        onChanged: onChangeEmail,
        enabled: !loading,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final bool showPassword, loading;
  final Function(String) onChangePassword;
  final Function() onToggleShowPassword;

  PasswordField({
    @required this.loading,
    @required this.showPassword,
    @required this.onChangePassword,
    @required this.onToggleShowPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(!showPassword ? Icons.visibility : Icons.visibility_off),
              onPressed: onToggleShowPassword,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onChanged: onChangePassword,
        obscureText: !showPassword,
        enabled: !loading,
      ),
    );
  }
}
