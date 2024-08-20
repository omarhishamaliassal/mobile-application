import 'package:flutter/material.dart';
import '../widgets/BussinessOwner_Display_Fields_Cards.dart';
import '../view-models/field_view_model.dart';
import 'package:e7gzly/view-models/home_view_model.dart';
import 'package:get/get.dart';
import '../view-models/reservations_view_model.dart';
import '../models/reservartions_details_model.dart';
import '../widgets/NavBarr.dart';
import '../widgets/card_text.dart';
import '../widgets/reservationCard.dart';

class myReservations extends StatelessWidget {
  const myReservations({super.key});

  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<ReservationsViewModel>(
      builder: (controller) => Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          title: const Text('Reservations'),
          centerTitle: true,
          backgroundColor: Color(0xFF303030),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GetBuilder<ReservationsViewModel>(
                builder: (controller) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.reservationsDetailsModel.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ReservationsCardText(
                      day: controller.reservationsDetailsModel[index].day,
                      fieldName:
                          controller.reservationsDetailsModel[index].fieldName,
                      reservedBy:
                          controller.reservationsDetailsModel[index].reservedBy,
                      timeSlot:
                          controller.reservationsDetailsModel[index].timeSlot,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
