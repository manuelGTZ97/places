import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:places/services/database.dart';

class HomeViewModel with ChangeNotifier {
  final AuthService _auth = AuthService();
  final DatabaseService _databaseService = DatabaseService();
  Future<QuerySnapshot> _placesCollection;

  Future get placesCollection => _placesCollection;

  set placesCollecition(Future<QuerySnapshot> collection) {
    _placesCollection = collection;
    notifyListeners();
  }

  HomeViewModel() {
    placesCollecition = _databaseService.getCollection();
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
