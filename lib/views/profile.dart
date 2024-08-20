import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e7gzly/views/profile_picture.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

import '../view-models/profile_view_model.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final CollectionReference _Users =
      FirebaseFirestore.instance.collection('Users');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _emailController.text = documentSnapshot['email'];
      _numberController.text = documentSnapshot['number'].toString()
        ..replaceAll(".0", "");
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'email',
                  ),
                ),
                TextField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    labelText: 'number',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String email = _emailController.text;
                    final double? number =
                        double.tryParse(_numberController.text);
                    if (number != null) {
                      await _Users.doc(documentSnapshot!.id).update(
                          {"name": name, "email": email, "number": number});
                      _nameController.text = '';
                      _emailController.text = '';
                      _numberController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => Scaffold(
              backgroundColor: Color.fromARGB(255, 27, 26, 26),
              body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .where("userId", isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Container(
                          height: 600,
                          margin: const EdgeInsets.all(8),
                          child: Stack(children: [
                            ListTile(
                              title: Column(children: [
                                SizedBox(
                                  height: 400,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF212121),
                                      border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        )
                                      ]),
                                  child: Text(
                                    "Username: " + documentSnapshot['name'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 241, 241, 241)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF212121),
                                      border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        )
                                      ]),
                                  child: Text(
                                    "Email: " + documentSnapshot['email'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 241, 241, 241)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF212121),
                                      border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        )
                                      ]),
                                  child: Text(
                                    "Phone number: " +
                                        documentSnapshot['number']
                                            .toString()
                                            .replaceAll(".0", ""),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 241, 241, 241)),
                                  ),
                                ),
                                Row(children: [
                                  SizedBox(
                                    width: 130,
                                  ),
                                  Text("Edit",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 241, 241, 241))),
                                  IconButton(
                                    onPressed: () => _update(documentSnapshot),
                                    icon: const Icon(Icons.edit),
                                    color: Color.fromARGB(255, 241, 241, 241),
                                  )
                                ]),
                              ]),
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.to(ImageUpload(
                                          userId: currentUser.currentUser!.uid,
                                        ));
                                      },
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 2,
                                                  blurRadius: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: Offset(0, 10))
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  "https://i.picsum.photos/id/114/200/300.jpg?hmac=RsaHLtW_cVJ2g7oCf2cW_kkIsaHv3QPZgv81ZYH5-aA",
                                                ))),
                                      )),
                                ],
                              ),
                            ),
                          ]));
                    },
                  );
                },
              ),
            ));
  }
}
