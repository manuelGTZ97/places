import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:places/view-models/authenticate-view-model.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticateViewModel authenticateViewModel =
        Provider.of<AuthenticateViewModel>(context, listen: false);

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
                  authenticateViewModel.setName(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) {
                  authenticateViewModel.setEmail(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (val) {
                  authenticateViewModel.setPassword(val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () async {
                  await authenticateViewModel.registerWithEmailAndPassword();
                },
              ),
            ],
          )),
    );
  }
}
