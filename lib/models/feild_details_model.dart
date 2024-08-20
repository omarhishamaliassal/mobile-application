class FeildDetailsModel {
  late String name, image, price, location;
  FeildDetailsModel(
      {required this.name,
      required this.price,
      required this.image,
      required this.location});

  FeildDetailsModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['Name'];
    image = map['Image'];
    price = map['Price'];
    location = map['Location'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'location': location,
    };
  }
}
