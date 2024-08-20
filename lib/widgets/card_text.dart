import 'package:e7gzly/models/feild_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:e7gzly/view-models/home_view_model.dart';
import 'package:get/get.dart';

import '../views/calendar.dart';

class CardText extends StatelessWidget {
  final String text;
  final String text1;
  final String text0;
  final String price;
  final String image;

  const CardText(
      {super.key,
      required this.text,
      required this.text1,
      required this.price,
      required this.image,
      required this.text0});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Center(
        //page fadya batest beha

        child: Container(
          width: 300,
          height: 320,
          decoration: BoxDecoration(
              color: const Color(0xFF212121),
              border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ]),
          //sooooooooooooooooooooooooooooooooooooooooooooora

          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 270,
                height: 150,
                child: Image.network(image, fit: BoxFit.fill),
              ),
              //teeeeeeeeeeeeeeeeexxxxxxxxxxxxxxtttttttt
              const SizedBox(
                height: 20,
              ),

              Container(
                  child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      text1,
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF5F5F5)),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Row(children: <Widget>[
                    const Icon(
                      Icons.place_outlined,
                      color: Colors.redAccent,
                      size: 25,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF5F5F5)),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(children: [
                    const Text(
                      "Rating:",
                      style: TextStyle(fontSize: 15, color: Color(0xFFF5F5F5)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFFF5F5F5),
                        ),
                      ),
                    )),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
