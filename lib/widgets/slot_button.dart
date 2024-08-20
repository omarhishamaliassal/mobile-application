import 'dart:ffi';

import 'package:e7gzly/external_apis/payment_screen.dart';
import 'package:flutter/material.dart';


class Slot_Button extends StatefulWidget {
  //final double slot;

  const Slot_Button({super.key});

  @override
  State<Slot_Button> createState() => _Slot_ButtonState();
}

class _Slot_ButtonState extends State<Slot_Button> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          SizedBox(
            width: 20,
            height: 200,
          ),
          for (int x = 1, y = 2; x <= 11; x++, y++) ...[
            if (y > 12) ...[],
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("$x pm - $y pm"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),
                      );
                    },
                  ),
                ))
          ],
        ]),
      ),

    ]);
  }

  time() {}
}
