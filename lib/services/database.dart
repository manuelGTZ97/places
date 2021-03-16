import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference placesCollection =
      Firestore.instance.collection('places');

  final String uid;

  DatabaseService({this.uid});

  Future<QuerySnapshot> getCollection() async {
    return placesCollection.getDocuments();
  }
}
