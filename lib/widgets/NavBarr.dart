import 'package:e7gzly/view-models/auth_view_model.dart';
import 'package:e7gzly/views/login_view.dart';
import 'package:e7gzly/views/my_profile_screen.dart';
import 'package:e7gzly/views/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view-models/profile_view_model.dart';

class NavBarr extends StatelessWidget {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  const NavBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Drawer(
        child: ListView(
          children: [
            Image.asset("assets/logo.png"),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text('My profile'),
              onTap: () => Get.to(profile()),
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
              onTap: () {
                controller.logOut();
                Get.offAll(LoginView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
