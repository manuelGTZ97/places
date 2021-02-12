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
        child: Column(children: <Widget>[
          Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.5],
                    colors: [Colors.tealAccent[100], Colors.greenAccent[200]]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(95),
                    bottomRight: Radius.circular(95)),
              ))
        ]));
  }
}

// showSignIn
//             ? SignIn(toggleView: toggleView)
//             : Register(toggleView: toggleView));
