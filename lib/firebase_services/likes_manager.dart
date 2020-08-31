import 'package:cloud_firestore/cloud_firestore.dart';
import 'basic_firebase.dart';

class LikesManager {
  static Future<void> addLikes(String myuid, String likeduid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('myuid', isEqualTo: myuid)
        .where('likeduid', isEqualTo: likeduid)
        .getDocuments();

    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      await db
          .collection('Likes')
          .document()
          .setData({"myuid": myuid, "likeduid": likeduid});
    }
  }

  static Future<void> getLikesData(String myuid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('likeduid', isEqualTo: myuid)
        .getDocuments();

    if (docSnapShot.documents.length > 0) {
      var data = docSnapShot.documents.map((doc) {
        return doc['myuid'];
      }).toList();

      print(data);
    }
    print("------ lol ------ ");
    print(docSnapShot.documents.length);
  }
}
