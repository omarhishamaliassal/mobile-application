import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../external_apis/payment_screen.dart';
import '../widgets/slot_button.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(today.toString().split(" ")[0]),
        Container(
            child: TableCalendar(
          rowHeight: 60,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: ((day) => isSameDay(day, today)),
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          onDaySelected: _onDaySelected,
          calendarStyle: const CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: Color.fromARGB(255, 162, 162, 162),
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: Color(0xFF212121),
              shape: BoxShape.circle,
            ),
            isTodayHighlighted: true,
            //selectedDecoration: BoxDecoration(),
          ),
        )),
        SizedBox(height: 80),
        Stack(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SizedBox(
                width: 20,
                height: 200,
              ),
              for (int x = 1, y = 2; x <= 11; x++, y++) ...[
                if (y > 12) ...[],
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: SizedBox(
                      width: 130,
                      height: 50,
                      child: ElevatedButton(
                        child: Text("$x pm - $y pm"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal),
                        ),
                        onPressed: () {
                          Get.to(PaymentScreen(), arguments: {
                            'time': "$x pm - $y pm",
                            'day': today,
                            'name': Get.arguments['name'],
                            'price': Get.arguments['price'],
                            'location': Get.arguments['location'],
                          });
                        },
                      ),
                    ))
              ],
            ]),
          ),
        ]),
      ],
    );
  }
}
