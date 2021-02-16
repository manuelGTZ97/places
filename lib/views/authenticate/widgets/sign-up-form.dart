import 'package:flutter/material.dart';
import 'package:places/view-models/sign-up-view-model.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpViewModel signUpViewModel =
        Provider.of<SignUpViewModel>(context, listen: true);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Form(
          key: null,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (val) {
                  signUpViewModel.setName(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) {
                  signUpViewModel.setEmail(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (val) {
                  signUpViewModel.setPassword(val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () async {
                  await signUpViewModel.registerWithEmailAndPassword();
                },
              ),
            ],
          )),
    );
  }
}
