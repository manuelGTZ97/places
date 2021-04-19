import 'package:flutter/material.dart';
import 'package:places/shared/widgets/main-drawer.dart';
import 'package:places/view-models/profile-view-model.dart';
import 'package:places/views/profile/widgets/sign-out-button.dart';
import 'package:provider/provider.dart';
import 'package:places/models/user.dart';

class Profile extends StatelessWidget {
  static const ROUTE_NAME = "/profile-screen";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
      child: Scaffold(
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
                backgroundImage: NetworkImage(user?.photoUrl ??
                    'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcTTHMaDqRBU2DsR2JjY6UG8xmKVvUpkR778T6-d8RQOTVuzZQsGHhQN4aJJ93pe3cP3NYLgEv7rpzjdZj64sqE'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                style: TextStyle(color: Colors.brown[200]),
                initialValue: user?.displayName ?? 'Places User',
                enabled: false,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                style: TextStyle(color: Colors.brown[200]),
                initialValue: user?.email ?? '',
                enabled: false,
              ),
              Spacer(),
              SignOutButton()
            ],
          ),
        ),
      ),
    );
  }
}
