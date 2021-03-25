import 'package:flutter/material.dart';
import 'package:places/wrapper.dart';
import 'package:places/views/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:places/models/user.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDraweState createState() => _MainDraweState();
}

class _MainDraweState extends State<MainDrawer> {
  void _selectHomeScreen() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Wrapper.ROUTE_NAME);
  }

  void _selectProfileScreen() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Profile.ROUTE_NAME);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.photoUrl),
                  ),
                  SizedBox(height: 20),
                  Text("Hi ${user.displayName}",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.5],
                    colors: [Colors.tealAccent[100], Colors.greenAccent[200]]),
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              _selectHomeScreen();
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              _selectProfileScreen();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
