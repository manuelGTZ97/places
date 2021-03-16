import 'package:flutter/cupertino.dart';
import 'package:places/services/auth.dart';

class AuthenticateViewModel with ChangeNotifier {
  final AuthService _auth = AuthService();
  String _email;
  String _password;
  String _name;

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

  Future signInWithEmailAndPassowrd() async {
    await _auth.signInWIthEmailAndPassword(_email, _password);
  }

  Future registerWithEmailAndPassword() async {
    await _auth.registerWithEmailAndPassword(_email, _password, _name);
    notifyListeners();
  }
}
