import 'ProfileImages.dart';

class ExploreProfile {
  String uid;
  String userName;
  int age;
  String race;
  String city;
  ProfileImages myimage;

  ExploreProfile({
    this.uid,
    this.userName,
    this.age,
    this.race,
    this.city,
    this.myimage,
  });

  ExploreProfile.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    age = json['age'];
    race = json['race'];
    city = json['city'];
    myimage = ProfileImages.fromJson(json['images']);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['uid'] = this.uid;
    data['userName'] = this.userName;
    data['age'] = this.age;
    data['race'] = this.race;
    data['city'] = this.city;
    data['myimage'] = this.myimage.toJson();

    return data;
  }
}
