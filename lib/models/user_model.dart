class UserModel {
  String? userId, email, name, pic;
  int? number;

  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.number,
      required this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    number = map['number'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'number': number
    };
  }
}
