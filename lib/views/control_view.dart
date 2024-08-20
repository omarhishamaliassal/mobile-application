import 'package:e7gzly/view-models/auth_view_model.dart';

import 'package:e7gzly/views/home_page.dart';
import 'package:e7gzly/views/login_view.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomePage()
          : LoginView();
    });
  }
}
