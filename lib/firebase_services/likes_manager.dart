import 'package:cloud_firestore/cloud_firestore.dart';
import 'basic_firebase.dart';
import 'package:nubae/firebase_services/profile_manager.dart';
import 'package:nubae/models/Like.dart';

class LikesManager {
  static Future<void> addLikes(String myuid, String likeduid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('myuid', isEqualTo: myuid)
        .where('likeduid', isEqualTo: likeduid)
        .getDocuments();

    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      String userName = await ProfileManager.getUserName(myuid);
      String userImage = await ProfileManager.getProfileImage(myuid);
      await db.collection('Likes').document().setData({
        "myuid": myuid,
        "likeduid": likeduid,
        "imageformyuid": userImage,
        "userNameFormyuid": userName
      });
    }
  }

  static Future<List<Like>> getLikesData(String myuid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('likeduid', isEqualTo: myuid)
        .getDocuments();

    List<Like> _list = [];

    _list = docSnapShot.documents.map((doc) {
      return Like.fromJson(doc.data);
    }).toList();

    return _list;
  }
}
