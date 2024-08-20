import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BussinessOwner_Home.dart';

class OwnerLogin extends StatefulWidget {
  const OwnerLogin({Key? key}) : super(key: key);

  @override
  State<OwnerLogin> createState() => _OwnerLogin();
}

class _OwnerLogin extends State<OwnerLogin> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 197, 197),
        body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Container(
                child: SingleChildScrollView(
                  reverse: true,
                  padding: EdgeInsets.all(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        "Welcome to e7gazly",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 15, 106, 15),
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 106, 15),
                        decoration: InputDecoration(
                            hintText: "Email ",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 15, 106, 15)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 106, 15),
                        decoration: InputDecoration(
                            hintText: "password",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 15, 106, 15)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Center(
                        child: OutlinedButton(
                          onPressed: (() {
                            Get.to(Home());
                          }),
                          child: Text('Login'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 15, 106, 15),
                            side: BorderSide(
                              color: Color.fromARGB(255, 15, 106, 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
