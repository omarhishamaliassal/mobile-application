import 'package:e7gzly/views/businessOwner_Reservations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../views/Add_New_Field.dart';
import '../views/BussinesOwner_Fields.dart';
import '../views/BussinessOwner_Settings.dart';
import '../views/login_view.dart';
import '../widgets/BussinessOwner_Drawer_Item.dart';

class NavigationDraw extends StatelessWidget {
  const NavigationDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Material(
        color: Color(0xFF303030),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(children: [
            headerWidget(),
            SizedBox(
              height: 20,
            ),
            DrawerItem(
              name: 'My Fields',
              onPressed: () => onItemPressed(context, index: 0),
            ),
            DrawerItem(
              name: 'Add Field',
              onPressed: () => onItemPressed(context, index: 1),
            ),
            DrawerItem(
              name: 'Account Settings',
              onPressed: () => onItemPressed(context, index: 2),
            ),
            DrawerItem(
              name: 'My Reservations',
              onPressed: () => onItemPressed(context, index: 3),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 232, 25, 25)),
              ),
              onPressed: () {
              Get.offAll(LoginView());
              
              },
              child: Text('SignOut'),
            )
          ]),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyFields()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewField()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myReservations()));
        break;
    }
  }

  Widget headerWidget() {
    const url = 'C:/Users/Dell/Downloads/app.png';
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Bussiness Owner Name',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('Owner@email.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}
