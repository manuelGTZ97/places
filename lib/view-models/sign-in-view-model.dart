import 'package:flutter/cupertino.dart';
import 'package:places/services/auth.dart';

class SignInViewModel with ChangeNotifier {
  final AuthService _auth = AuthService();
  String _email;
  String _password;

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future signInWithEmailAndPassowrd() async {
    await _auth.signInWIthEmailAndPassword(_email, _password);
  }
}
