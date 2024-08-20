import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/reservations_service.dart';
import 'package:e7gzly/models/feild_details_model.dart';
import '../services/field_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/reservartions_details_model.dart';

class ReservationsViewModel extends GetxController {
  List<ReservationsDetailsModel> get reservationsDetailsModel =>
      _reservationsDetailsModel;
  List<ReservationsDetailsModel> _reservationsDetailsModel = [];

  final CollectionReference _reservationsCollection =
      FirebaseFirestore.instance.collection('Reservations');

  ReservationsViewModel() {
    getReservationsDetails();
  }

  getReservationsDetails() async {
    ReservationsService().getReservationsDetails().then((value) {
      for (int i = 0; i < value.length; i++) {
        _reservationsDetailsModel.add(ReservationsDetailsModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));
      }
      print(_reservationsDetailsModel.length);
      update();
    });
  }
}
