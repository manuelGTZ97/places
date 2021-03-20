import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:places/view-models/home-view-model.dart';
import 'package:places/views/home/widgets/place-tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel =
        Provider.of<HomeViewModel>(context, listen: true);
    return FutureBuilder<QuerySnapshot>(
        future: homeViewModel.placesCollection,
        builder: (context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            return ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot place =
                      snapshot.data.documents.elementAt(index);
                  return PlaceTile(place: place);
                });
          } else if (snapshot.hasError) {
            child = Text('An error has occurred');
          } else {
            child = SpinKitRing(
                color: Theme.of(context).primaryColor, size: 40, lineWidth: 4);
          }
          return Center(
              child: Container(
            padding: EdgeInsets.all(20),
            child: child,
          ));
        });
  }
}
