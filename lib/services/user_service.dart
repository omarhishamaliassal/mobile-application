import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getUserId() async {
  List<String> userId = [];
  await FirebaseFirestore.instance
      .collection('Users')
      .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .limit(1)
      .get()
      .then(
        (snapShot) => snapShot.docs.forEach((user) {
          userId.add(user.id);
        }),
      );

  return userId[0];
}

Future createField(
    {required String name,
    required String price,
    required String location}) async {
  final userInsatnce = FirebaseFirestore.instance.collection('Fields').doc();
  final currentID = await getUserId();
  final userData = {
    'Image': '',
    'Name': name,
    'Price': price,
    'Location': location,
    'ID': currentID
  };

  await userInsatnce.set(userData);
}

Future deleteField({required name}) async {
  //String myuserid = await getUserId();
  await FirebaseFirestore.instance
      .collection('Fields')
      .where('Name', isEqualTo: name)
      .limit(1)
      .get()
      .then((snapshot) => snapshot.docs[0].reference.delete());
}
