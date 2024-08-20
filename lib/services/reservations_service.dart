import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationsService {
  final CollectionReference _reservationsCollection =
      FirebaseFirestore.instance.collection('Reservations');

  Future<List<QueryDocumentSnapshot>> getReservationsDetails() async {
    
    var value = await _reservationsCollection.get();
    return value.docs;
  }
}
