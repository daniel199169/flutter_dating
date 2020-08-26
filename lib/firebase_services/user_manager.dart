import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/ExploreProfile.dart';
import 'basic_firebase.dart';
import 'package:geolocator/geolocator.dart';

enum Gender { male, female }

class UserManager {
  static Future<List<ExploreProfile>> getData(String uid) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<ExploreProfile> _list = [];
    List<ExploreProfile> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return ExploreProfile.fromJson(doc.data);
    }).toList();
    
    print("kkkkkk    -------    kkkkkkkk");
    print(uid);
    for(int i=0; i<_list.length; i++){
      print("^^^^^^^^^  --------  ^^^^^^^^");
      print(_list[i].uid);
      if(uid != _list[i].uid){
        _result.add(_list[i]);
      }
    }
    return _result;
  }

  static Future<List<ExploreProfile>> searchData(
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
    List<ExploreProfile> _list = [];
    List<ExploreProfile> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return ExploreProfile.fromJson(doc.data);
    }).toList();

    for (int i = 0; i < _list.length; i++) {
      // if(_list[i].age >= minAge && _list[i].age <= maxAge && _list[i].male == male){
      //   _result.add(_list[i]);
      // }
      print(uid);
      print(i);
      print(_list[i].uid);
      if (uid != _list[i].uid) {
        double tempDistance = await getDistance(
            mylatitude, mylongitude, _list[i].latitude, _list[i].longitude);
        print("print ********   *********");
        print(distance);
        print(tempDistance);
        if (_list[i].age >= minAge &&
            _list[i].age <= maxAge &&
            _list[i].male == male &&
            _list[i].cuisine == cuisine &&
            _list[i].entertainment == entertainment &&
            _list[i].recreation == recreation &&
            tempDistance <= distance) {
          _result.add(_list[i]);
        }

        // if (_list[i].age >= minAge &&
        //     _list[i].age <= maxAge &&
        //     _list[i].male == male 
        //     &&
        //     _list[i].cuisine == cuisine &&
        //     _list[i].entertainment == entertainment &&
        //     _list[i].recreation == recreation 
        //    ) {
        //   _result.add(_list[i]);
        // }
      }
    }
    print("tttttt  +++++++  tttttttt");
    print(_result.length);

    return _result;
  }

  static getDistance(
      double startlat, double startlon, double endlat, double endlon) async {
    double distanceInMeters =
        await Geolocator().distanceBetween(startlat, startlon, endlat, endlon);
    print("&&&&&&&&    &&&&&&&");
    print(distanceInMeters);
    return distanceInMeters / 1000;
  }
}
