import 'package:flutter/cupertino.dart';
import 'package:places/services/auth.dart';
import 'package:places/services/database.dart';

class AddPlaceViewModel with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  String _description;
  String _image;
  String _postedByUserId;
  String _title;

  setDescription(String description) {
    _description = description;
    notifyListeners();
  }

  setImage(String image) {
    _image = image;
    notifyListeners();
  }

  setPostedByUserId(String postedByUserId) {
    _postedByUserId = postedByUserId;
    notifyListeners();
  }

  setTitle(String title) {
    _title = title;
    notifyListeners();
  }
}
