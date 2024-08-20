import 'package:e7gzly/widgets/Button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Resveration extends StatefulWidget {
  final String name;
  final String price;
  final String size;
  final String type;
  final String url;
  final String img;

  const Resveration({
    super.key,
    required this.name,
    required this.price,
    required this.size,
    required this.type,
    required this.url,
    required this.img,
  });

  @override
  State<Resveration> createState() => _ResverationState();
}

class _ResverationState extends State<Resveration> {
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          widget.img,
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
                  "${widget.name}",
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 240, 235, 235)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42, left: 10),
              child: Text(
                "${widget.price} EGP Per Hour",
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
                    child: Text('''${widget.size}

${widget.type}''',
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
                      child: Text("Click here to view Location",
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
            onPressed: () => TimePick(context),
            textColor: Colors.white,
            button_color: Color.fromARGB(255, 63, 164, 8))
      ]),
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    );
  }

  Future TimePick(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
/*Align(
                alignment: Alignment.topRight,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: TextStyle(color: Color.fromARGB(255, 227, 31, 31)),
                      text: "Go To"),
                  TextSpan(
                      style: TextStyle(color: Color.fromARGB(255, 62, 16, 214)),
                      text: "Click here",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "https://www.youtube.com";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw "cannt run it";
                          }
                        })
                ])),
              )*/