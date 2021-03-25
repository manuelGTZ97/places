import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(
            uid: user.uid,
            displayName: user.displayName,
            email: user.email,
            photoUrl: user.photoUrl)
        : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signInWIthEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await _registerUserClaims(user, name);
      await _registerUserInCollection(user, name);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future _registerUserClaims(FirebaseUser user, String name) async {
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    userUpdateInfo.photoUrl =
        'https://en.gravatar.com/userimage/188268126/ec3c8212c7215e4be04252c57cd1dec2.jpg';
    await user.updateProfile(userUpdateInfo);
  }

  Future _registerUserInCollection(FirebaseUser user, String name) async {
    await Firestore.instance.collection("users").document(user.uid).setData({
      "displayName": name,
      "email": user.email,
      "photoUrl":
          'https://en.gravatar.com/userimage/188268126/ec3c8212c7215e4be04252c57cd1dec2.jpg',
    });
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
