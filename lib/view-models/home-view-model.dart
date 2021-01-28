import 'package:flutter/cupertino.dart';
import 'package:places/services/auth.dart';

class HomeViewModel {
  final AuthService _auth = AuthService();

  Future signOut() async {
    await _auth.signOut();
  }
}
