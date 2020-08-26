import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/ExploreProfile.dart';
import 'basic_firebase.dart';

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
      String sex,
      String cuisine,
      String entertainment,
      String recreation) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<ExploreProfile> _list = [];
    _list = querySnapshot.documents.map((doc) {
      return ExploreProfile.fromJson(doc.data);
    }).toList();

    return _list;
  }
}
