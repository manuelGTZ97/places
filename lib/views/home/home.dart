import 'package:flutter/material.dart';
import 'package:places/view-models/home-view-model.dart';
import 'package:places/views/home/places-list.dart';
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
        body: PlacesList(),
        // body: Column(
        //   children: <Widget>[
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 30),
        //         alignment: Alignment.centerLeft,
        //         child: Text(
        //           'Places App',
        //           style: Theme.of(context).textTheme.headline5,
        //         ),
        //         height: 70,
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //           color: Theme.of(context).primaryColor,
        //           borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(40),
        //               bottomRight: Radius.circular(40)),
        //         )),

        //   ],
        // ),
      ),
    );
  }
}
