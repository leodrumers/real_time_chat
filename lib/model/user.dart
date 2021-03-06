class User {
  User({
    this.online,
    this.name,
    this.email,
    this.uid,
  });

  bool online;
  String name;
  String email;
  String uid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        online: json["online"],
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "name": name,
        "email": email,
        "uid": uid,
      };
}
