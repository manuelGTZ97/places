import 'package:flutter/material.dart';
import 'package:places/view-models/authenticate-view-model.dart';
import 'package:provider/provider.dart';
import 'package:meta/meta.dart';

class SignIn extends StatelessWidget {
  final Function toggleView;

  SignIn({@required this.toggleView});

  @override
  Widget build(BuildContext context) {
    final AuthenticateViewModel authenticateViewModel =
        Provider.of<AuthenticateViewModel>(context, listen: true);

    void onSetEmail(val) {
      authenticateViewModel.setEmail(val);
    }

    void onSetPassword(val) {
      authenticateViewModel.setPassword(val);
    }

    Future onSubmit() async {
      await authenticateViewModel.signInWithEmailAndPassowrd();
    }

    return Scaffold(
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
        Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: null,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    onChanged: (val) {
                      onSetEmail(val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    onChanged: (val) {
                      onSetPassword(val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      child: Text(
                        "Sign In",
                      ),
                      onPressed: onSubmit)
                ],
              ),
            )),
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
    ));
  }
}
