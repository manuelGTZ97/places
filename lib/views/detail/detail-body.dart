import 'package:flutter/material.dart';
import 'package:places/models/place.dart';

class DetailBody extends StatelessWidget {
  final Place place;
  DetailBody({this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(place.user.photoUrl),
                    ),
                    SizedBox(height: 5),
                    Text("Posted by: ${place.user.displayName}",
                        style: Theme.of(context).textTheme.caption)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(place.description,
                style: Theme.of(context).textTheme.bodyText2),
          )
        ],
      ),
    );
  }
}
