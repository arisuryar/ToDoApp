class Users {
  String? uid;
  String? name;
  String? email;
  String? photoUrl;
  String? createdAt;
  String? provider;
  String? lastSignIn;

  Users(
      {this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.createdAt,
      this.provider,
      this.lastSignIn});

  Users.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    createdAt = json['createdAt'];
    provider = json['provider'];
    lastSignIn = json['lastSignIn'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['createdAt'] = createdAt;
    data['provider'] = provider;
    data['lastSignIn'] = lastSignIn;
    return data;
  }
}
