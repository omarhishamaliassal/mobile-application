class ReservationsDetailsModel {
  late String day, fieldName, reservedBy, timeSlot;
  ReservationsDetailsModel({
    required this.day,
    required this.fieldName,
    required this.reservedBy,
    required this.timeSlot,
  });

  ReservationsDetailsModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    day = map['day'];
    fieldName = map['fieldName'];
    reservedBy = map['reservedBy'];
    timeSlot = map['timeSlot'];
  }

  toJson() {
    return {
      'name': day,
      'image': fieldName,
      'price': reservedBy,
      'location': timeSlot,
    };
  }
}
