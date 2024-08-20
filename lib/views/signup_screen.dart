import 'package:e7gzly/view-models/auth_view_model.dart';
import 'package:e7gzly/widgets/Button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/Text_Widget.dart';
import 'business_provider_register_screen.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          // alignment: MainAxisAlignment.center,
          //alignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    labelText: "Full Name",
                    keyboardType: TextInputType.emailAddress,
                    Placeholder: "",
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.email),
                    onSave: (value) {
                      controller.name = value!;
                    },
                    validat: (value) {
                      if (value == null) {
                        print("EMail Must Be Entered");
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    labelText: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    Placeholder: "",
                    hintText: "Email Address",
                    prefixIcon: Icon(Icons.email),
                    onSave: (value) {
                      controller.email = value!;
                    },
                    validat: (value) {
                      if (value == null) {
                        print("EMail Must Be Entered");
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    labelText: "Phone Number",
                    keyboardType: TextInputType.phone,
                    Placeholder: "",
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                    onSave: (value) {
                      controller.number = int.parse(value!);
                    },
                    validat: (value) {
                      if (value == null) {
                        print("Number Must Be Entered");
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  /* CustomTextField(
                      labelText: "Address",
                      keyboardType: TextInputType.text,
                      Placeholder: "",
                      hintText: "Address",
                      prefixIcon: Icon(Icons.location_city)),
                  SizedBox(
                    height: 30,
                  ),
                  */
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
                        ;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    child: CustomElevatedButton(
                        inputText: "Submit",
                        onPressed: () {
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate()) {
                            controller.creatAccountwithEmailAndPassword();
                          }
                        }),
                  ),
                  CustomTextButton(
                      inputText: "Signup as an Admin",
                      onPressed: () {
                        Get.to(BPRegisterScreen());
                      }),
                ],
              ),
            ),
          ],
        ));
    ;
  }
}
