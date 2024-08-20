import 'package:e7gzly/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../views/BussinessOwner_Home.dart';

class FieldsCardText extends StatelessWidget {
  final String place;
  final String Field;
  final String price;

  const FieldsCardText(
      {super.key,
      required this.place,
      required this.Field,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 285,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 51, 51, 51),
            borderRadius: BorderRadius.horizontal(),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 185, 185, 185).withOpacity(0.5),
                spreadRadius: 0.5,
                offset: Offset(0, 0),
              )
            ]),
        //sooooooooooooooooooooooooooooooooooooooooooooora
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),

              //teeeeeeeeeeeeeeeeexxxxxxxxxxxxxxtttttttt
              SizedBox(
                height: 5,
              ),
              Text(
                'Field Information',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 232, 134)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Place : " + place,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic),
              ),

              Text(
                "Field Number : " + Field,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Price per hour : " + price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF5F5F5),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(97, 20, 30, 0),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(85, 40),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      deleteField(name: Field);
                      Get.to(Home());
                    },
                    child: const Text('Delete'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
