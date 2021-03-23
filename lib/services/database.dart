import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places/models/place.dart';
import 'package:places/models/user.dart';

class DatabaseService {
  final CollectionReference placesCollection =
      Firestore.instance.collection('places');
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future<List<Place>> getPlacesCollection() async {
    QuerySnapshot collection = await placesCollection.getDocuments();

    List<Place> places = collection.documents.map((doc) {
      return Place(
          description: doc.data['description'] ?? '',
          image: doc.data['image'] ?? '',
          postedByUserId: doc.data['postedByUserId'],
          title: doc.data['title']);
    }).toList();

    for (Place place in places) {
      place.user = await _getUserFromCollection(place.postedByUserId);
    }

    return Future<List<Place>>.value(places);
  }

  Future<User> _getUserFromCollection(String uid) async {
    DocumentSnapshot snapshot = await userCollection.document(uid).get();
    return User(
        displayName: snapshot.data['displayName'] ?? '',
        email: snapshot.data['email'] ?? '',
        photoUrl: snapshot.data['photoUrl'] ?? '');
  }
}
