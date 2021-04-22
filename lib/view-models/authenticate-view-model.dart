import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:places/services/auth.dart';

class AuthenticateViewModel with ChangeNotifier {
  final AuthService _auth = AuthService();
  String _email;
  String _password;
  String _name;
  StreamController<String> _messageError =
      new StreamController<String>.broadcast();

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  Stream<String> get messageError {
    return _messageError.stream.map((x) => x);
  }

  Future signInWithEmailAndPassowrd() async {
    try {
      await _auth.signInWIthEmailAndPassword(_email, _password);
      notifyListeners();
    } catch (e) {
      _messageError.add(e.message);
    }
  }

  Future registerWithEmailAndPassword() async {
    try {
      await _auth.registerWithEmailAndPassword(_email, _password, _name);
      notifyListeners();
    } catch (e) {
      _messageError.add(e.message);
    }
  }
}
