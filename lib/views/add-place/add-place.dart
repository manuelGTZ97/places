import 'package:flutter/material.dart';
import 'package:places/view-models/add-place-view-model.dart';
import 'package:places/views/add-place/widgets/add-place-appbar.dart';
import 'package:places/views/add-place/widgets/add-place-form.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPlaceViewModel>(
      create: (context) => AddPlaceViewModel(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: AddPlaceAppbar()),
        body: SingleChildScrollView(
          child: AddPlaceForm(),
        ),
      ),
    );
  }
}
