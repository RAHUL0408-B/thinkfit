
import 'package:get/get.dart';
import '../view_model/on_board_page/onboard_controller.dart';

class BoardBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut(()=>OnboardController());
  }
}