import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/User.dart';
import 'basic_firebase.dart';
import 'package:geolocator/geolocator.dart';

enum Gender { male, female }

class UserManager {
  static Future<List<User>> getData(String uid) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<User> _list = [];
    List<User> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return User.fromJson(doc.data);
    }).toList();

    for (int i = 0; i < _list.length; i++) {
      if (uid != _list[i].uid) {
        _result.add(_list[i]);
      }
    }
    return _result;
  }

  static Future<List<User>> searchData(
      double distance,
      double minAge,
      double maxAge,
      bool male,
      String cuisine,
      String entertainment,
      String recreation,
      double mylatitude,
      double mylongitude,
      String uid) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<User> _list = [];
    List<User> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return User.fromJson(doc.data);
    }).toList();

    for (int i = 0; i < _list.length; i++) {
      if (uid != _list[i].uid) {
        double tempDistance = await getDistance(
            mylatitude, mylongitude, _list[i].latitude, _list[i].longitude);
        if (cuisine != "" && entertainment == "" && recreation == "") {
          if (_list[i].age >= minAge &&
              _list[i].age <= maxAge &&
              _list[i].male == male &&
              _list[i].cuisine == cuisine &&
              tempDistance <= distance) {
            _result.add(_list[i]);
          }
        }
        if (cuisine == "" && entertainment != "" && recreation == "") {
          if (_list[i].age >= minAge &&
              _list[i].age <= maxAge &&
              _list[i].male == male &&
              _list[i].entertainment == entertainment &&
              tempDistance <= distance) {
            _result.add(_list[i]);
          }
        }
        if (cuisine == "" && entertainment == "" && recreation != "") {
          if (_list[i].age >= minAge &&
              _list[i].age <= maxAge &&
              _list[i].male == male &&
              _list[i].recreation == recreation &&
              tempDistance <= distance) {
            _result.add(_list[i]);
          }
        }
      }
    }

    return _result;
  }

  static getDistance(
      double startlat, double startlon, double endlat, double endlon) async {
    double distanceInMeters =
        await Geolocator().distanceBetween(startlat, startlon, endlat, endlon);

    return distanceInMeters / 1000;
  }
}
