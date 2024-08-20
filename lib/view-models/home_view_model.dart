import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e7gzly/models/category_model.dart';
import 'package:e7gzly/models/feild_details_model.dart';
import 'package:e7gzly/services/home_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<FeildDetailsModel> get feildDetailsModel => _feildDetailsModel;
  List<FeildDetailsModel> _feildDetailsModel = [];

  FeildDetailsModel? fieldDetails;

  setFieldDetails(FeildDetailsModel fieldDet) {
    fieldDetails = fieldDet;
  }

  getFieldDetails() {
    return fieldDetails;
  }

  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('Category');

  HomeViewModel() {
    getCategory();
    getFeildDetails();
  }

  getCategory() async {
    _loading.value = true;
    await _categoryCollection.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(
            value.docs[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
        // print(_categoryModel.length);
      }
      update();
    });
  }

  getFeildDetails() async {
    _loading.value = true;
    HomeService().getFeildDetails().then((value) {
      for (int i = 0; i < value.length; i++) {
        _feildDetailsModel.add(FeildDetailsModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));
      }
      _loading.value = false;
      print(_feildDetailsModel.length);
      update();
    });
  }
}
