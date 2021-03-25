import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  PickedFile _image;

  _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: ClipRRect(
                  child: _image != null
                      ? Image.file(
                          File(_image.path),
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://content.hostgator.com/img/weebly_image_sample.png',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        )),
            )
          ],
        ));
  }
}
