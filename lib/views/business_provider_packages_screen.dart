import 'package:flutter/material.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(),
        body: Column(
          children: [
            SizedBox(height: 120),
            Text("Subscribe Packages",
                style: TextStyle(fontSize: 34, color: Colors.white)),
            Row(mainAxisAlignment: MainAxisAlignment.center),
            SizedBox(height: 30),
            buildPackageComponent("Package 1", "100 EGP per month"),
            buildPackageComponent("Package 2", "250 EGP per 3months"),
            buildPackageComponent("Package 3", "999 EGP per year")
          ],
        ));
  }

  Widget buildPackageComponent(String packageName, String pricePerDate) {
    return Container(
        child: Column(children: [
      Container(
        child: Text(packageName,
            style: TextStyle(fontSize: 35, color: Colors.white)),
        color: Colors.grey,
        width: 300,
        height: 50,
        padding: EdgeInsets.only(left: 65),
      ),
      SizedBox(height: 0),
      Container(
        child: Text(pricePerDate,
            style: TextStyle(fontSize: 22, color: Colors.white)),
        height: 80,
        width: 300,
        padding: EdgeInsets.only(left: 55, top: 10),
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.lightGreenAccent,
              width: 3,
            )),
      ),
      ElevatedButton(
        onPressed: () {},
        child: Text('Subscribe'),
        style: ElevatedButton.styleFrom(primary: Colors.green),
      ),
      SizedBox(height: 30)
    ]));
  }
}
