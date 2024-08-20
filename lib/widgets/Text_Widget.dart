import 'package:flutter/material.dart';

Widget buildTextField(String labelText, String Placeholder,
    bool isPasswordTextField, final void Function(String?) onSave) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
        obscureText: isPasswordTextField ? true : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                    onPressed: () {},
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: Placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87))),
  );
}

class CustomPasswordTextField extends StatelessWidget {
  final String labelText;
  final String Placeholder;
  final bool isPasswordTextField;
  final String hintText;
  final void Function(String?) onSave;
  final FormFieldValidator validat;

  const CustomPasswordTextField(
      {required this.labelText,
      required this.Placeholder,
      required this.isPasswordTextField,
      required this.hintText,
      required this.onSave,
      required this.validat});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(Icons.password),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
              isPasswordTextField ? Icons.visibility : Icons.visibility_off),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(221, 199, 218, 66)),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 230, 225, 225),
      ),
      obscureText: isPasswordTextField,
      onChanged: (String value) {},
      validator: validat,
      onSaved: onSave,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String Placeholder;
  final Icon prefixIcon;
  final TextInputType keyboardType;
  final String hintText;
  final void Function(String?) onSave;
  final FormFieldValidator validat;

  const CustomTextField(
      {required this.labelText,
      required this.keyboardType,
      required this.Placeholder,
      required this.hintText,
      required this.prefixIcon,
      required this.onSave,
      required this.validat});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly,
      //   LengthLimitingTextInputFormatter(19)
      // ],
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3.5, color: Color.fromARGB(221, 199, 218, 66)),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 236, 236),
      ),
      onSaved: onSave,
      validator: validat,
      onChanged: (String value) {},
    );
  }
}
