import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/User.dart';
import 'basic_firebase.dart';
import 'package:geolocator/geolocator.dart';

class LikesManager {
  static Future<void> addLikes(String myuid, String likeduid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('myuid', isEqualTo: myuid)
        .where('myuid', isEqualTo: likeduid)
        .getDocuments();

    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      await db
          .collection('Likes')
          .document()
          .setData({"myuid": myuid, "lieduid": likeduid});
    }
  }
}
