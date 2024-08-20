import 'package:flutter/material.dart';

import '../widgets/theme_changer.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[
                Container(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/1.jpg'),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Aly Khaled',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'lolo@gmail.com',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ]),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Profile'),
              onTap: () {
                print('Profile clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Previous'),
              onTap: () {
                print('Previous clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Language'),
              onTap: () {
                print('Language clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dark/Light Theme'),
              onTap: () {
                // ThemeBuilder.of(context)?.changeTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
