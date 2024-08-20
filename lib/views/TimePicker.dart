import 'package:e7gzly/views/Reservation.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) => Resveration(
      name: "Feild 4",
      price: "200",
      size: "7*8",
      type: "Natural ",
      url: "www",
      img: "assets/images/Stad.jpg");

  Future TimePick(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
