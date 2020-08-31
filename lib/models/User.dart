import 'ProfileImages.dart';

class User {
  String uid;
  String userName;
  int age;
  String race;
  String city;
  bool male;
  String cuisine;
  String entertainment;
  String recreation;
  double latitude;
  double longitude;
  ProfileImages myimage;

  User({
    this.uid,
    this.userName,
    this.age,
    this.race,
    this.city,
    this.male,
    this.cuisine,
    this.entertainment,
    this.recreation,
    this.latitude,
    this.longitude,
    this.myimage,
  });

  User.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    age = json['age'];
    race = json['race'];
    city = json['city'];
    male = json['male'];
    cuisine = json['Cuisine'];
    entertainment = json['Entertainment'];
    recreation = json['Recreation'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    myimage = ProfileImages.fromJson(json['images']);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['uid'] = this.uid;
    data['userName'] = this.userName;
    data['age'] = this.age;
    data['race'] = this.race;
    data['city'] = this.city;
    data['male'] = this.male;
    data['Cuisine'] = this.cuisine;
    data['Entertainment'] = this.entertainment;
    data['Recreation'] = this.recreation;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['myimage'] = this.myimage.toJson();

    return data;
  }
}
