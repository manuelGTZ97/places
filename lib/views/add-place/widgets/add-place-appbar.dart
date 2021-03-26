import 'package:flutter/material.dart';
import 'package:places/models/user.dart';
import 'package:places/view-models/add-place-view-model.dart';
import 'package:provider/provider.dart';

class AddPlaceAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddPlaceViewModel addPlaceViewModel =
        Provider.of<AddPlaceViewModel>(context, listen: true);
    final user = Provider.of<User>(context);

    return AppBar(
      elevation: 0,
      actions: <Widget>[
        FlatButton(
          child: Text('Save'),
          onPressed: () async {
            await addPlaceViewModel.savePlace(user.uid);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
