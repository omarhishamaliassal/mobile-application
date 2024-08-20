import 'package:flutter/material.dart';

class buildCard extends StatelessWidget {
  final String category;
  final Image image;

  const buildCard({super.key, required this.category, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0xFF212121),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: image,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              category,
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: Color.fromARGB(255, 166, 166, 166)),
            )),
          ],
        ),
      ),
    );
  }
}
