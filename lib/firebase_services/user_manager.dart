import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/ExploreProfile.dart';
import 'basic_firebase.dart';
import 'package:geolocator/geolocator.dart';

enum Gender { male, female }

class UserManager {
  static Future<List<ExploreProfile>> getData() async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<ExploreProfile> _list = [];
    _list = querySnapshot.documents.map((doc) {
      return ExploreProfile.fromJson(doc.data);
    }).toList();

    return _list;
  }

  static Future<List<ExploreProfile>> searchData(
      double distance,
      double minAge,
      double maxAge,
      bool male,
      String cuisine,
      String entertainment,
      String recreation) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<ExploreProfile> _list = [];
    List<ExploreProfile> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return ExploreProfile.fromJson(doc.data);
    }).toList();

    for (int i = 0; i < _list.length; i++) {
      // if(_list[i].age >= minAge && _list[i].age <= maxAge && _list[i].male == male){
      //   _result.add(_list[i]);
      // }

      if (_list[i].age >= minAge &&
          _list[i].age <= maxAge &&
          _list[i].male == male &&
          _list[i].cuisine == cuisine &&
          _list[i].entertainment == entertainment &&
          _list[i].recreation == recreation) {
        _result.add(_list[i]);
      }
    }

    return _result;
  }

  static getDistance(
      double startlat, double startlon, double endlat, double endlon) async {

    double distanceInMeters =
        await Geolocator().distanceBetween(startlat, startlon, endlat, endlon);

    return int.parse((distanceInMeters/1000).toString());
  }
}
