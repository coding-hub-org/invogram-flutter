import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthenticateState extends ChangeNotifier {
  static AuthenticateState of(BuildContext context, {bool listen: true}) {
    return Provider.of<AuthenticateState>(context, listen: listen);
  }

  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseUser _user;

  Future<String> signIn(String email, String password) async {
    try {
      _user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _user = null;
    }
    return (_user != null) ? _user.uid : null;
  }
}
