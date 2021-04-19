import 'package:flutter/material.dart';
import 'package:places/view-models/home-view-model.dart';
import 'package:places/views/add-place/add-place.dart';
import 'package:provider/provider.dart';

class AddPlaceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel =
        Provider.of<HomeViewModel>(context, listen: true);

    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute<AddPlace>(
                builder: (BuildContext context) {
                  return AddPlace();
                },
                fullscreenDialog: true))
            .then((value) => {homeViewModel.getPlacesCollection()});
      },
      child: const Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
