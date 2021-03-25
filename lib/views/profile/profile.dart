import 'package:flutter/material.dart';
import 'package:places/shared/widgets/main-drawer.dart';
import 'package:provider/provider.dart';
import 'package:places/models/user.dart';

class Profile extends StatelessWidget {
  static const ROUTE_NAME = "/profile-screen";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Name"),
              style: TextStyle(color: Colors.brown[200]),
              initialValue: user.displayName,
              enabled: false,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Email"),
              style: TextStyle(color: Colors.brown[200]),
              initialValue: user.email,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
