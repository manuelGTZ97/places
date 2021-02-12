import 'package:flutter/material.dart';
import 'package:places/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: RaisedButton(
            child: Text('Log out'),
            onPressed: () {
              final AuthService _auth = AuthService();
              _auth.signOut();
            },
          ),
        ));
  }
}
