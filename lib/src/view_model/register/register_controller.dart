import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  TextEditingController get firstName => _firstName;

  TextEditingController get lastName => _lastName;

  TextEditingController get email => _email;

  TextEditingController get password => _password;

  RxBool obscureText = true.obs;
  RxBool isAccepted = false.obs;

  void togglePassword() {
    obscureText.value = !obscureText.value;
    print("ObscureText has ${obscureText.value}");
  }
}
