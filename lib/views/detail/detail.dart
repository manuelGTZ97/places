import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/styles/hotel_landing_page/public/2020-01/angel-independencia-historia.jpg?itok=XTs0r_eK'),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
