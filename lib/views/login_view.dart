import 'package:e7gzly/view-models/auth_view_model.dart';
import 'package:e7gzly/views/BussinessOwner_Home.dart';
import 'package:e7gzly/views/BussinessOwner_Login.dart';
import 'package:e7gzly/views/Sign-upview.dart';
import 'package:e7gzly/views/signup_screen.dart';
import 'package:e7gzly/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import '../widgets/Text_Widget.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          //Image.asset('assets/images/logo.png'),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // if (!isKeyboard) Image.asset('assets/images/logo.png'),
                  Image.asset('assets/logo.png'),

                  CustomTextField(
                    labelText: "Email",
                    keyboardType: TextInputType.name,
                    Placeholder: "",
                    hintText: "Email",
                    prefixIcon: Icon(Icons.person),
                    onSave: (value) {
                      controller.email = value!;
                    },
                    validat: (value) {
                      if (value == null) {
                        print("Email Must Be Entered");
                      }
                    },
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  CustomPasswordTextField(
                    labelText: "Password",
                    Placeholder: "",
                    isPasswordTextField: true,
                    hintText: "Password",
                    onSave: (value) {
                      controller.password = value!;
                    },
                    validat: (value) {
                      if (value == null) {
                        print("Password Must Be Entered");
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 220,
                    height: 40,
                    child: CustomElevatedButton(
                        inputText: "Login",
                        onPressed: () {
                          _formKey.currentState?.save();

                          controller.signInwithEmailAndPassword();
                        }),
                  ),

                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {
                      controller.googleSignInMethod();
                    },
                  ),
                  CustomTextButton(
                      onPressed: () {}, inputText: "Forgot your password?"),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: const Text(
                      'Do not have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.underline, // <-- SEE HERE
                      ),
                    ),
                  ),
                  CustomTextButton(
                      onPressed: () {
                        Get.to(OwnerLogin());
                      },
                      inputText: "Login As Owner"),
                ],
              ),
            ),
          ],
        ));
  }
}
