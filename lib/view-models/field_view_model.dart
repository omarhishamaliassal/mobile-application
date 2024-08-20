import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e7gzly/models/feild_details_model.dart';
import '../services/field_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FieldViewModel extends GetxController {
  List<FeildDetailsModel> get feildDetailsModel => _feildDetailsModel;
  List<FeildDetailsModel> _feildDetailsModel = [];


  FieldViewModel() {
    getFeildDetails();
  }


  getFeildDetails() async {
    FieldService().getFeildDetails().then((value) {
      for (int i = 0; i < value.length; i++) {
        _feildDetailsModel.add(FeildDetailsModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));
      }
      print(_feildDetailsModel.length);
      update();
    });
  }
}
