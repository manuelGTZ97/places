import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot place;
  PlaceTile({this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print('Hello');
        },
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
                  image: NetworkImage(
                      'https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/styles/hotel_landing_page/public/2020-01/angel-independencia-historia.jpg?itok=XTs0r_eK'),
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
                  color: Theme.of(context).accentColor,
                  width: double.infinity,
                  height: double.infinity,
                  child: Text('Data'),
                )),
          ],
        ),
      ),
    );
  }
}

// Stack(
//       alignment: Alignment.center,
//       textDirection: TextDirection.rtl,
//       fit: StackFit.loose,
//       clipBehavior: Clip.none,
//       overflow: Overflow.visible,
//       children: <Widget>[
//         Card(
//           child: InkWell(
//             onTap: () {
//               print('hello');
//             },
//             child: Container(
//               height: 230,
//               width: MediaQuery.of(context).size.width - 5,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/styles/hotel_landing_page/public/2020-01/angel-independencia-historia.jpg?itok=XTs0r_eK'),
//                   fit: BoxFit.cover,
//                   alignment: Alignment.topCenter,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//             bottom: 2,
//             left: 2,
//             width: MediaQuery.of(context).size.width - 5,
//             height: 50,
//             child: Container(
//               color: Theme.of(context).accentColor,
//               width: double.infinity,
//               height: double.infinity,
//               child: Text('Data'),
//             )),
//       ],
//     );
