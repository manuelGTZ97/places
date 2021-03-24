import 'package:flutter/material.dart';
import 'package:places/models/place.dart';
import 'package:places/views/detail/detail-body.dart';

class Detail extends StatelessWidget {
  final Place place;
  Detail({this.place});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(place.image), fit: BoxFit.cover)),
            ),
            SizedBox(height: 10),
            DetailBody(place: place)
          ],
        ),
      ),
    );
  }
}
