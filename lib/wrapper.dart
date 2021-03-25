import 'package:flutter/material.dart';
import 'package:places/views/authenticate/sing-in.dart';
import 'package:provider/provider.dart';
import 'package:places/models/user.dart';
import 'package:places/views/home/home.dart';

class Wrapper extends StatelessWidget {
  static const ROUTE_NAME = "/";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return SignIn();
    } else {
      return Home();
    }
  }
}
