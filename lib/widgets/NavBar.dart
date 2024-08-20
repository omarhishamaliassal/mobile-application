import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset("assets/images/logo.png"),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notifications'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
