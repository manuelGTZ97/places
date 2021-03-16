import 'package:flutter/material.dart';
import 'package:places/view-models/authenticate-view-model.dart';
import 'package:places/views/authenticate/widgets/sign-up-form.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticateViewModel>(
      create: (context) => AuthenticateViewModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign Up'),
        ),
        body: SingleChildScrollView(child: SignUpForm()),
      ),
    );
  }
}
