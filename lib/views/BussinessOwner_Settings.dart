import 'package:flutter/material.dart';
import '../widgets/BussinessOwner_Settings_Text_Widget.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(205, 255, 255, 255),
        appBar: AppBar(
          title: const Text('Account Settings'),
          centerTitle: true,
          backgroundColor: Color(0xFF303030),
        ),
        body: Center(
            child: Container(
                child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            buildTextField("Name", "Ali Ahmed Saad", false),
            buildTextField("Email", "AliSaad@gmail.com", false),
            buildTextField("Address", "45 somewhere st.", false),
            buildTextField("Password", "***", true),
          ],
        ))));
  }
}
