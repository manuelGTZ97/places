import 'package:flutter/material.dart';
import 'package:places/view-models/authenticate-view-model.dart';
import 'package:places/views/authenticate/register.dart';
import 'package:places/views/authenticate/sign-in.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticateViewModel>(
        create: (context) => AuthenticateViewModel(),
        child: showSignIn
            ? SignIn(toggleView: toggleView)
            : Register(toggleView: toggleView));
  }
}
