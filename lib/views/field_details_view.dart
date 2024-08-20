import 'package:e7gzly/views/calendar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/feild_details_model.dart';
import '../widgets/Button.dart';

class FieldDetailsView extends StatelessWidget {
  FeildDetailsModel model;

  FieldDetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Image.network(
            model.image,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  model.name,
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 240, 235, 235)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42, left: 10),
              child: Text(
                model.price,
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 230, 225, 225)),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Reviews",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 240, 235, 235)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            )
          ]),
        ),
        Divider(
          color: Color.fromARGB(255, 92, 95, 94),
          indent: 50,
          endIndent: 50,
          height: 55,
          thickness: 1,
        ),
        Container(
          height: 100,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('''Size

Field type''',
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 244, 246),
                            fontSize: 15)),
                  )),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text('''8*8}

turf''',
                        style: TextStyle(
                            color: Color.fromARGB(255, 220, 222, 224),
                            fontSize: 15)),
                  ))
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 11, 11, 11),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 92, 95, 94),
          indent: 50,
          endIndent: 50,
          height: 15,
          thickness: 1,
        ),
        Container(
          height: 110,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("About Field",
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 244, 246),
                            fontSize: 20)),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, bottom: 20),
                      child: Text(model.location,
                          style: TextStyle(
                              color: Color.fromARGB(255, 234, 227, 227),
                              fontSize: 12)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 2),
                child: Icon(
                  Icons.facebook,
                  size: 30,
                  color: Color.fromARGB(255, 40, 124, 213),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, top: 35),
                      child: Text("Faceebok Page",
                          style: TextStyle(
                              color: Color.fromARGB(255, 234, 227, 227),
                              fontSize: 12)),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Button(
            button_name: "Book Time Slot",
            onPressed: () {
              Get.to(Calendar(), arguments: {
                'name': model.location,
                'price': model.price,
                'location': model.name,
              });
            },
            textColor: Colors.white,
            button_color: Color.fromARGB(255, 63, 164, 8))
      ]),
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    );
  }
}
