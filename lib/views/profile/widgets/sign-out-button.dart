import 'package:flutter/material.dart';
import 'package:places/view-models/profile-view-model.dart';
import 'package:provider/provider.dart';

import '../../../wrapper.dart';

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileViewModel profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: true);

    return ElevatedButton.icon(
        label: Text('Sign Out'),
        icon: Icon(Icons.exit_to_app),
        style: ElevatedButton.styleFrom(primary: Colors.red[600]),
        onPressed: () {
          profileViewModel.signOut();
          Navigator.of(context).pushNamed(Wrapper.ROUTE_NAME);
        });
  }
}
