import 'package:flutter/material.dart';
import '../widgets/BussinessOwner_Navigation_Drawer.dart';
import '../widgets/BussinessOwner_Insights_Cards.dart';

/*void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}*/

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  String? Selected = '1';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      drawer: const NavigationDraw(),
      appBar: AppBar(
        title: const Text('Business Dashboard'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      // ignore: prefer_const_constructors
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            height: 40,
            child: Text(
              'INSIGHTS',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              child: Row(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      height: 36,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      height: 36,
                      child: Center(
                        child: DropdownButton<String>(
                          value: Selected,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 10,
                          style: const TextStyle(color: Colors.white),
                          underline: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() => Selected = item),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            child: BusinessOwnerCardText(
              Subject: 'Total Earnings ',
              icon: Icons.money_sharp,
              amount: '600',
            ),
          ),
          Container(
            height: 120,
            child: BusinessOwnerCardText(
              Subject: 'Total Hours Booked ',
              icon: Icons.timelapse,
              amount: '6',
            ),
          ),
          Container(
            height: 120,
            child: BusinessOwnerCardText(
              Subject: 'Most Booked Field ',
              icon: Icons.favorite_border,
              amount: '1',
            ),
          )
        ],
      ),
    );
  }
}
