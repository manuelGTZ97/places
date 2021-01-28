import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:places/view-models/authenticate-view-model.dart';
import 'package:places/views/authenticate/widgets/authenticate-form.dart';
import 'package:meta/meta.dart';

class Register extends StatelessWidget {
  final Function toggleView;

  Register({@required this.toggleView});

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
      await authenticateViewModel.registerWithEmailAndPassword();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: Text('Sign up to Places',
              style: TextStyle(fontWeight: FontWeight.normal)),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: toggleView,
                textColor: Colors.white,
                icon: Icon(Icons.person),
                label: Text('Sign in'))
          ],
        ),
        body: AuthenticateForm(
          onSetEmail: onSetEmail,
          onSetPassword: onSetPassword,
          onSubmit: onSubmit,
          buttonLabel: 'Register',
        ));
  }
}
