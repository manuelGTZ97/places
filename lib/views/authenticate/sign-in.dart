import 'package:flutter/material.dart';
import 'package:places/shared/widgets/oval-gradient-container.dart';
import 'package:places/view-models/sign-in-view-model.dart';
import 'package:provider/provider.dart';
import 'package:places/views/authenticate/widgets/sign-in-form.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (context) => SignInViewModel(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: <Widget>[
          OvalGradientContainer(
              height: 350, borderBottomLeft: 95, borderBottomRight: 95),
          SignInForm(),
          Container(
            child: Column(children: <Widget>[
              Text("OR"),
              SizedBox(height: 10.0),
              FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(0),
                  child: Text("Sign Up"),
                  onPressed: () {})
            ]),
          )
        ]),
      )),
    );
  }
}
