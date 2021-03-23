import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:places/models/place.dart';
import 'package:places/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:places/services/database.dart';

class HomeViewModel with ChangeNotifier {
  final AuthService _auth = AuthService();
  final DatabaseService _databaseService = DatabaseService();
  Future<List<Place>> _placesCollection;

  Future get placesCollection => _placesCollection;

  set placesCollecition(Future<List<Place>> collection) {
    _placesCollection = collection;
    notifyListeners();
  }

  HomeViewModel() {
    placesCollecition = _databaseService.getPlacesCollection();
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
