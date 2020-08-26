import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/models/ProfileImages.dart';

abstract class BaseAuth {
  // Future<String> signIn(String email, String password);
  Future<String> signIn(String email, String password);

  Future<String> signUp(
      String email,
      String password,
      String username,
      int age,
      bool maleGender,
      String race,
      String country,
      String city,
      LatLng userlocation);

  // Future<bool> signOut();

}

class DateAuth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print('--------><-------: Firebase User: ' + user.toString());
      return user.uid;
    } catch (er) {
      print(er);
      return null;
    }
  }

  Future<String> signUp(
      String email,
      String password,
      String username,
      int age,
      bool maleGender,
      String race,
      String country,
      String city,
      LatLng userlocation) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(result);
    FirebaseUser user = result.user;
    ProfileImages images = new ProfileImages(myimageURL: "", myphoto1URL: "", myphoto2URL: "", myphoto3URL: "");
    try {
      await Firestore.instance
          .collection("Users")
          .document(user.uid)
          .setData({
            "uid": user.uid,
            "userName": username,
            "email": email,
            "age": age,
            "male": maleGender,
            "race": race,
            "country": country,
            "city": city,
            "latitude": userlocation.latitude,
            "longitude": userlocation.longitude,
            "images": images.toJson(),
            "Cuisine": "",
            "Entertainment": "",
            "Recreation": "",
          })
          .then((result) => {})
          .catchError((err) => print(err));
      return user.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
