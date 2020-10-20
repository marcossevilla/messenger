class User {
  User({
    this.online,
    this.name,
    this.email,
    this.uid,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      online: json['online'],
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  bool online;
  String name;
  String email;
  String uid;

  Map<String, dynamic> toJson() => {
        'online': online,
        'name': name,
        'email': email,
        'uid': uid,
      };
}
