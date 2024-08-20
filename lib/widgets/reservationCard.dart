import 'package:flutter/material.dart';

class ReservationsCardText extends StatelessWidget {
  final String day;
  final String fieldName;
  final String reservedBy;
  final String timeSlot;

  const ReservationsCardText({
    super.key,
    required this.day,
    required this.fieldName,
    required this.reservedBy,
    required this.timeSlot,
  });

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
                'Reservation Information',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 232, 134)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Day : " + day,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic),
              ),

              Text(
                "Field Name : " + fieldName,
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
                "Reserved By : " + reservedBy,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF5F5F5),
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "Time Slot : " + timeSlot,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF5F5F5),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
