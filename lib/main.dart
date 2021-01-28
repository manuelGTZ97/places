import 'package:flutter/material.dart';
import 'package:places/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:places/models/user.dart';
import 'package:places/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user, child: MaterialApp(home: Wrapper()));
  }
}
