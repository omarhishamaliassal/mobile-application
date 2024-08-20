import 'package:e7gzly/models/user_model.dart';
import 'package:e7gzly/views/control_view.dart';
import 'package:e7gzly/views/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helpers/local_storage.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  GoogleSignIn _gooleSignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;
  late int number;
  final LocalStorageData localStorageData = Get.find();

  Rxn<User> _user = Rxn<User>();
  /* String? get user {
    try {
      _user.value!.email;
    } catch (e) {
      print("Value B NULL");
    }
  }*/

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleuser = await _gooleSignin.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleuser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    try {
      await _auth.signInWithCredential(credential).then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: user.user?.displayName,
          pic: '',
          number: 011,
        ));
        setUser(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: user.user?.displayName,
          pic: '',
          number: 011,
        ));
        Get.offAll(HomePage());
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Color.fromARGB(255, 245, 243, 243),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInwithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) => {
              setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>))
            });
      });
      Get.offAll(() => HomePage());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Color.fromARGB(255, 245, 243, 243),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void creatAccountwithEmailAndPassword() async {
    try {
      _loading.value = true;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: name,
          pic: 'Picture',
          number: number,
        ));
        setUser(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: user.user?.displayName,
          pic: '',
          number: number,
        ));
        _loading.value = false;
      });

      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error while creating account", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Color.fromARGB(255, 245, 243, 243));
    }
  }

  Future<void> logOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
