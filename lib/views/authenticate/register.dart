import 'package:flutter/material.dart';
import 'package:places/view-models/sign-up-view-model.dart';
import 'package:places/views/authenticate/widgets/sign-up-form.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final Function toggleView;

  Register({@required this.toggleView});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Sign up to Places'),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: toggleView,
                  icon: Icon(Icons.person),
                  label: Text('Sign in'))
            ],
          ),
          body: SignUpForm()),
    );
  }
}
