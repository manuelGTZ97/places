import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:places/models/user.dart';
import 'package:places/views/authenticate/authenticate.dart';
import 'package:places/views/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
