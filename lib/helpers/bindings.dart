import 'package:e7gzly/helpers/local_storage.dart';
import 'package:e7gzly/view-models/auth_view_model.dart';
import 'package:e7gzly/view-models/home_view_model.dart';
import 'package:e7gzly/views/control_view.dart';
import 'package:get/get.dart';
import '../view-models/reservations_view_model.dart';
import '../view-models/field_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());

    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ReservationsViewModel());
    Get.lazyPut(() => FieldViewModel());
  }
}
