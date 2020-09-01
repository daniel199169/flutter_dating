class Like {
  String myuid;
  String likeduid;
  String imageformyuid;
  String userNameFormyuid;

  Like({
    this.myuid = '',
    this.likeduid = '',
    this.imageformyuid = '',
    this.userNameFormyuid = '',
  });

  Like.fromJson(Map<dynamic, dynamic> json) {
    myuid = json['myuid'];
    likeduid = json['likeduid'];
    imageformyuid = json['imageformyuid'];
    userNameFormyuid = json['userNameFormyuid'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['myuid'] = this.myuid;
    data['likeduid'] = this.likeduid;
    data['imageformyuid'] = this.imageformyuid;
    data['userNameFormyuid'] = this.userNameFormyuid;

    return data;
  }
}
