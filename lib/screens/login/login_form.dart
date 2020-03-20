import 'package:flutter/material.dart';
import 'package:invogram/providers/authentication_state.dart';
import 'package:invogram/screens/routes.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email, _password, _error = '';
  bool _showPassword = true;
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  onChangePassword(String value) {
    setState(() {
      _password = value.trim();
    });
  }

  onChangeEmail(String value) {
    setState(() {
      _email = value.trim();
    });
  }

  onClickShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  onClickSignInButton() async {
    setState(() {
      _loading = true;
    });
    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Logging In'),
        duration: Duration(minutes: 5),
      ));
      String userId = await AuthenticateState().signIn(_email, _password);
      Scaffold.of(context).hideCurrentSnackBar();
      if (userId == null) {
        setState(() {
          _error = 'Wrong user or password';
        });
      } else {
        setState(() {
          _error = '';
        });
        Navigator.pushNamed(context, Routes.reminder.name);
      }
    }
    setState(() {
      _loading = false;
    });
  }

  Widget emailField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
          if (isValid) {
            return value.isEmpty ? 'Email can\'t be empty' : null;
          } else {
            return 'Email is not valid';
          }
        },
        onChanged: (value) => onChangeEmail(value),
        enabled: !_loading,
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(!_showPassword ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onChanged: (value) => onChangePassword(value),
        obscureText: _showPassword,
        enabled: !_loading,
      ),
    );
  }

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
            onPressed: () => onClickSignInButton(),
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
      _error,
      style: TextStyle(color: Colors.red),
    );
  }

  Widget signInFields() {
    return Column(
      children: <Widget>[
        emailField(),
        passwordField(),
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
      key: _formKey,
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
