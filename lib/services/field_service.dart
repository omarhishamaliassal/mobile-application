import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e7gzly/services/user_service.dart';

class FieldService {
  final CollectionReference _fieldsCollection =
      FirebaseFirestore.instance.collection('Fields');

  Future<List<QueryDocumentSnapshot>> getFeildDetails() async {
    final myuserid = await getUserId();
    var value = await _fieldsCollection.where('ID', isEqualTo: myuserid).get();
    return value.docs;
  }
}
