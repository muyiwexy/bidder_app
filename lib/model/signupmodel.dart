class UserFields {
  static const String id = "\$id";
  static const String name = "name";
  static const String email = "email";
  static const String registrationDate = "registration";
}

class User {
  String? id;
  String? name;
  String? email;

  User({
    required this.id,
    required this.email,
    required this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json[UserFields.id];
    name = json[UserFields.name];
    email = json[UserFields.email];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[UserFields.name] = name;
    return data;
  }
}
