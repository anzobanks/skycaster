import 'package:get/get.dart';
import 'package:skycaster/pages/onboarding_page.dart';

import 'getanimed_controller.dart';

class AppController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(5.seconds).then((value) {
      Get.put(GetAnimatedController());
      Get.offAll(OnBoardingPage());
    });
  }
}
