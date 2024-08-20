/*import 'package:e7gzly/view-models/auth_view_model.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:e7gzly/views/business_provider_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({super.key});

  bool _obsecureText = true;
  final _formKey = GlobalKey<FormState>();
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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 212, 212, 80)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 195, 186, 186),
                    ),
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (EmailValidator.validate(value) == false) {
                        return 'invalid mail';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Number',
                      hintText: ' Number',
                      prefixIcon: Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 212, 212, 80)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 195, 186, 186),
                    ),
                    onSaved: (value) {
                      controller.number = int.parse(value!);
                    },
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 212, 212, 80)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 195, 186, 186),
                    ),
                    obscureText: _obsecureText,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'ConfirmPassword',
                      hintText: 'ConfirmPassword',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 212, 212, 80)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 195, 186, 186),
                    ),
                    obscureText: _obsecureText,
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        controller.creatAccountwithEmailAndPassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      //<-- SEE HERE
                      backgroundColor: Color.fromARGB(255, 212, 212, 80),
                      side: BorderSide(
                        width: 3.0,
                        color: Color.fromARGB(255, 212, 212, 80),
                      ),
                    ),
                    child: Text('Submit'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BPRegisterScreen();
                        }),
                      );
                    },
                    style: TextButton.styleFrom(
                      //<-- SEE HERE
                      side: BorderSide(width: 3.0),
                    ),
                    child: Text('Signup as an Admin'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
*/