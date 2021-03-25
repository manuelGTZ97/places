import 'package:flutter/material.dart';
import 'package:places/services/auth.dart';
import 'package:places/views/add-place/add-place.dart';
import 'package:places/views/profile/profile.dart';
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
          routes: {
            '/': (_) => Wrapper(),
            '/profile-screen': (_) => Profile(),
            '/add-place-screen': (_) => AddPlace()
          },
          initialRoute: '/',
          theme: ThemeData(
              backgroundColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              brightness: Brightness.light,
              primaryColor: Colors.greenAccent[200],
              accentColor: Colors.brown[200],
              buttonTheme: ButtonThemeData(
                  buttonColor: Colors.brown[200],
                  textTheme: ButtonTextTheme.normal),
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelStyle: TextStyle(color: Colors.brown[200]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.brown[300]),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.brown[300]),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.brown[100]),
                ),
              ),
              textTheme: TextTheme(
                  bodyText2: TextStyle(fontWeight: FontWeight.normal))),
        ));
  }
}
