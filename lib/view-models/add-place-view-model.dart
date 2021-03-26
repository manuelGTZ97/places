import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/services/database.dart';

class AddPlaceViewModel with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  String _description;
  PickedFile _image;
  String _title;
  String _urlImage;
  String _postedByUserId;

  setDescription(String description) {
    _description = description;
    notifyListeners();
  }

  setImage(PickedFile image) {
    _image = image;
    notifyListeners();
  }

  PickedFile get image => _image;

  setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  setUrlImage(String urlImage) {
    _urlImage = urlImage;
    notifyListeners();
  }

  setPostedByUserId(String postedByUserId) {
    _postedByUserId = postedByUserId;
    notifyListeners();
  }

  imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    setImage(image);
  }

  savePlace(uid) async {
    setPostedByUserId(uid);
    await _databaseService.savePlaceInCollection(
        _title, _description, _urlImage, _postedByUserId);
  }
}
