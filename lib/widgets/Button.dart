import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  final String button_name;
  final VoidCallback onPressed;
  final Color textColor;
  final Color button_color;

  const Button(
      {super.key,
      required this.button_name,
      required this.onPressed,
      required this.textColor,
      required this.button_color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.70,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          button_name,
          style: TextStyle(color: textColor, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: button_color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPrimary: Colors.amber,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String inputText;

  const CustomButton({required this.inputText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        //<-- SEE HERE
        side: BorderSide(width: 3.0),
      ),
      child: Text(inputText),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String inputText;
  final VoidCallback onPressed;
  const CustomElevatedButton(
      {required this.inputText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromARGB(221, 199, 218, 66),
        side: BorderSide(
          width: 3.0,
          //color: Color.fromARGB(221, 250, 249, 249),
        ),
      ),
      child: Text(inputText, style: TextStyle(fontSize: 17)),
    );
  }
}

class ElevatedButtonIcon extends StatelessWidget {
  final String inputText;
  final VoidCallback onPressed;
  final Button prefixButton;
  const ElevatedButtonIcon(
      {required this.inputText,
      required this.onPressed,
      required this.prefixButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: ElevatedButton.icon(
          onPressed: onPressed, icon: prefixButton, label: Text(inputText)),
      style: ElevatedButton.styleFrom(
        //<-- SEE HERE

        backgroundColor: Colors.amber,
        side: BorderSide(
          width: 3.0,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String inputText;
  final VoidCallback onPressed;
  const CustomTextButton({required this.inputText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        //<-- SEE HERE
        side: BorderSide(width: 3.0),
      ),
      child: Text(inputText),
    );
  }
}
