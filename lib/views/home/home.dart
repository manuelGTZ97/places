import 'package:flutter/material.dart';
import 'package:places/shared/widgets/oval-gradient-container.dart';
import 'package:places/view-models/home-view-model.dart';
import 'package:places/views/home/widgets/places-list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Text('Places App'),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.5
                      ],
                      colors: [
                        Colors.tealAccent[100],
                        Colors.greenAccent[200]
                      ]),
                )),
            ListTile(
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {},
            )
          ],
        )),
        body: Column(
          children: <Widget>[
            OvalGradientContainer(
                height: 70, borderBottomLeft: 40, borderBottomRight: 40),
            PlacesList()
          ],
        ),
      ),
    );
  }
}
