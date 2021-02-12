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
        value: AuthService().user,
        child: MaterialApp(
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.greenAccent[200],
                textTheme: TextTheme(
                    bodyText2: TextStyle(fontWeight: FontWeight.normal))),
            home: Wrapper()));
  }
}
