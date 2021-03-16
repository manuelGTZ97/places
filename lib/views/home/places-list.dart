import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:places/view-models/home-view-model.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel =
        Provider.of<HomeViewModel>(context, listen: true);
    return FutureBuilder<QuerySnapshot>(
        future: homeViewModel.placesCollection,
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            print(snapshot.data.documents);
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot place =
                      snapshot.data.documents.elementAt(index);
                  return Column(
                    children: <Widget>[Text(place.data['title'])],
                  );
                });
          } else if (snapshot.hasError) {
            children = <Widget>[Text('hasError')];
          } else {
            children = <Widget>[Text('nothing')];
          }
          return Center(child: Column(children: children));
        });
  }
}
