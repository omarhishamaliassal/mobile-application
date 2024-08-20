import 'package:flutter/material.dart';

class BusinessOwnerCardText extends StatelessWidget {
  final IconData icon;
  final String Subject;
  final String amount;

  const BusinessOwnerCardText({
    super.key,
    required this.icon,
    required this.Subject,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          //code to open the details
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(icon),
              title: Text(
                Subject,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  amount.toString(),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
