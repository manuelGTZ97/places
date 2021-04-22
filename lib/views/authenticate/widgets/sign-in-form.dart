import 'package:flutter/material.dart';
import 'package:places/view-models/authenticate-view-model.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
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
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) {
                  authenticateViewModel.setEmail(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                onChanged: (val) {
                  authenticateViewModel.setPassword(val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  child: Text(
                    "Sign In",
                  ),
                  onPressed: () async {
                    await authenticateViewModel.signInWithEmailAndPassowrd();
                  }),
              StreamBuilder(
                  stream: authenticateViewModel.messageError,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData) {
                      return Text("");
                    }
                    return Text(snapshot.data,
                        style: TextStyle(color: Colors.red[500]));
                  }),
            ],
          ),
        ));
  }
}
