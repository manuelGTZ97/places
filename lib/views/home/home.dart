import 'package:flutter/material.dart';
import 'package:places/shared/widgets/oval-gradient-container.dart';
import 'package:places/view-models/home-view-model.dart';
import 'package:places/views/add-place/add-place.dart';
import 'package:places/views/home/widgets/places-list.dart';
import 'package:provider/provider.dart';
import 'package:places/shared/widgets/main-drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = (SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            OvalGradientContainer(
                height: 70, borderBottomLeft: 40, borderBottomRight: 40),
            SizedBox(height: 20),
            PlacesList(),
          ],
        )));

    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // actions: <Widget>[
          //   FlatButton(
          //     onPressed: () {},
          //     child: Text('Log Out'),
          //   )
          // ],
        ),
        drawer: MainDrawer(),
        body: body,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute<AddPlace>(
                builder: (BuildContext context) {
                  return AddPlace();
                },
                fullscreenDialog: true));
          },
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
