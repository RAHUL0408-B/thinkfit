import 'package:fitnest_app/src/view_model/main_tab_controller.dart';
import 'package:fitnest_app/src/view_model/register/profile_controller.dart';
import 'package:get/get.dart';

class MainTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainTabController());
  }
}
