import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AuthenticateForm extends StatefulWidget {
  final Function onSetEmail;
  final Function onSetPassword;
  final Function onSubmit;
  final String buttonLabel;

  AuthenticateForm(
      {@required this.onSetEmail,
      @required this.onSetPassword,
      @required this.onSubmit,
      this.buttonLabel});

  _AuthenticateFormState createState() => _AuthenticateFormState();
}

class _AuthenticateFormState extends State<AuthenticateForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: (InputDecoration(
                    fillColor: Colors.white, filled: true, hintText: 'Email')),
                validator: (val) {
                  return val.isEmpty ? 'Enter an email' : null;
                },
                onChanged: (val) {
                  widget.onSetEmail(val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: (InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Password',
                )),
                validator: (val) {
                  return val.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null;
                },
                onChanged: (val) {
                  widget.onSetPassword(val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green[300],
                child: Text(
                  widget.buttonLabel,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await widget.onSubmit();
                },
              ),
            ],
          )),
    );
  }
}
