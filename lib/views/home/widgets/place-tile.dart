import 'package:flutter/material.dart';
import 'package:places/models/place.dart';
import 'package:places/views/detail/detail.dart';

class PlaceTile extends StatelessWidget {
  final Place place;
  PlaceTile({this.place});

  @override
  Widget build(BuildContext context) {
    onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Detail(
                    place: place,
                  )));
    }

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          textDirection: TextDirection.rtl,
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          overflow: Overflow.visible,
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(place.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width - 8,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withOpacity(0.85)),
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(place.title,
                      style: Theme.of(context).textTheme.subtitle1),
                )),
          ],
        ),
      ),
    );
  }
}
