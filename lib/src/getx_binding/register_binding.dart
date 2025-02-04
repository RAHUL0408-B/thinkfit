
import 'package:get/get.dart';
import '../view_model/register/register_controller.dart';



class RegisterBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut(()=>RegisterController());
  }
}