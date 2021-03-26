import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/view-models/add-place-view-model.dart';
import 'package:provider/provider.dart';

class AddPlaceForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddPlaceViewModel addPlaceViewModel =
        Provider.of<AddPlaceViewModel>(context, listen: true);

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
                          addPlaceViewModel.imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
            );
          });
    }

    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          // GestureDetector(
          //   onTap: () {
          //     _showPicker(context);
          //   },
          //   child: ClipRRect(
          //       child: Container(
          //           decoration: BoxDecoration(
          //               border:
          //                   Border.all(color: Theme.of(context).accentColor)),
          //           child: addPlaceViewModel.image != null
          //               ? Image.file(
          //                   File(addPlaceViewModel.image.path),
          //                   width: 250,
          //                   height: 200,
          //                   fit: BoxFit.cover,
          //                 )
          //               : Image.network(
          //                   'http://www.plafam.org.ve/wp-content/themes/15zine/library/images/placeholders/placeholder-759x500@2x.png',
          //                   width: 250,
          //                   height: 200,
          //                   fit: BoxFit.cover,
          //                 ))),
          // ),
          Form(
              key: null,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Title"),
                    onChanged: (val) {
                      addPlaceViewModel.setTitle(val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Description"),
                    minLines: 2,
                    maxLines: 5,
                    onChanged: (val) {
                      addPlaceViewModel.setDescription(val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Image Url"),
                    onChanged: (val) {
                      addPlaceViewModel.setUrlImage(val);
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
