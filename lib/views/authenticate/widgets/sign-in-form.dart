import 'package:flutter/material.dart';
import 'package:places/view-models/sign-in-view-model.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignInViewModel signInViewModel =
        Provider.of<SignInViewModel>(context, listen: true);

    return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: null,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) {
                  signInViewModel.setEmail(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                onChanged: (val) {
                  signInViewModel.setPassword(val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  child: Text(
                    "Sign In",
                  ),
                  onPressed: () async {
                    await signInViewModel.signInWithEmailAndPassowrd();
                  })
            ],
          ),
        ));
  }
}
