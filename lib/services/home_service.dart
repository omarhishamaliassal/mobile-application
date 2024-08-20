import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _feildsCollection =
      FirebaseFirestore.instance.collection('Fields');

  Future<List<QueryDocumentSnapshot>> getFeildDetails() async {
    var value = await _feildsCollection.get();
    return value.docs;
  }
}
