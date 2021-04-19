import 'package:flutter/material.dart';
import 'package:places/services/auth.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel with ChangeNotifier {
  final AuthService _auth = AuthService();

  Future signOut() async {
    await _auth.signOut();
  }
}
