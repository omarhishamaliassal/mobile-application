import 'package:e7gzly/helpers/local_storage.dart';
import 'package:e7gzly/models/user_model.dart';

import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();
  UserModel get userModel => _userModel!;
  UserModel? _userModel;

  void getCurrentUser() async {
    await localStorageData.getUser.then((value) => {_userModel = value});
    update();
  }
}
