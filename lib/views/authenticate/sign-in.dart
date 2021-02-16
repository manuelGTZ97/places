import 'package:flutter/material.dart';
import 'package:places/view-models/sign-in-view-model.dart';
import 'package:provider/provider.dart';
import 'package:meta/meta.dart';
import 'package:places/views/authenticate/widgets/sign-in-form.dart';

class SignIn extends StatelessWidget {
  final Function toggleView;

  SignIn({@required this.toggleView});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (context) => SignInViewModel(),
      child: Scaffold(
          body: SingleChildScrollView(
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
              )),
          SignInForm(),
          Container(
            child: Column(children: <Widget>[
              Text("OR"),
              SizedBox(height: 10.0),
              FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(0),
                  child: Text("Sign Up"),
                  onPressed: toggleView)
            ]),
          )
        ]),
      )),
    );
  }
}
