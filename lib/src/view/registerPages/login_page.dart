import 'package:fitnest_app/common/constants/app_image.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/common/widgets/custom_text_field.dart';
import 'package:fitnest_app/src/themes/color_scheme.dart';
import 'package:fitnest_app/src/view_model/register/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../common/constants/app_icon.dart';
import '../../../common/constants/validation.dart';
import '../../../common/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1, vertical: Get.height * 0.1),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Hey there,",
                  style: textTheme(context)
                      .titleSmall
                      ?.copyWith(color: Colors.black)),
              Text("Welcome Back",
                  style: textTheme(context)
                      .bodySmall
                      ?.copyWith(color: lightColorScheme.onSecondary)),
              SizedBox(
                height: Get.height * 0.02,
              ),

              CustomTextField(
                icon: SvgPicture.asset(
                  AppIcon.message,
                  fit: BoxFit.contain,
                ),
                hintText: "Email",
                controller: registerController.email,
                validator: validateEmail,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(()=>
                  CustomTextField(
                    icon: SvgPicture.asset(
                      AppIcon.lock,
                      fit: BoxFit.contain,
                    ),
                    hintText: "Password",
                    controller: registerController.password,
                    obscureText: registerController.obscureText.value,
                    validator: validatePassword,
                    suffixIcon:
                    IconButton(
                        onPressed: () {

                          registerController.togglePassword();
                        },
                        icon: Icon(
                          registerController.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: registerController.obscureText.value
                              ? colorScheme(context).onSecondary.withOpacity(0.2)
                              : colorScheme(context).error.withOpacity(0.8),
                        )),
                  ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextButton(onPressed: (){}, child: Text("Forgot your password?",

                style: textTheme(context)
                    .titleSmall
                    ?.copyWith(color: Colors.black.withOpacity(0.4),
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black.withOpacity(0.4),
                ),
              ),),
              SizedBox(
                height: Get.height * 0.25,
              ),
              CustomButton(
                pressed: () {
                 Get.toNamed("/welcome");
                },

                text: "",
                width: Get.width * 0.7,
                height: Get.height * 0.064,
                gradient: LinearGradient(colors: [
                  colorScheme(context).primary,
                  colorScheme(context).secondary
                ]),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                     AppIcon.loginIcon,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Login",  // Text next to the icon
                      style: textTheme(context).bodyMedium?.copyWith(
                        color: Colors.white,  // Change text color as needed
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                        endIndent: 10,
                        color:
                        colorScheme(context).onSecondary.withOpacity(0.2)),
                  ),
                  Text(
                    "Or",
                    style: textTheme(context).titleSmall,
                  ),
                  Expanded(
                    child: Divider(
                        indent: 10,
                        color:
                        colorScheme(context).onSecondary.withOpacity(0.2)),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialButton(AppImage.google, () {}),
                  _buildSocialButton(AppImage.facebook, () {}),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: "Don’t have an account yet? ",
                  style: textTheme(context).bodyLarge?.copyWith(
                    color: colorScheme(context).onSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                        text: " Register",
                        style: textTheme(context).bodyLarge?.copyWith(
                          color: colorScheme(context).secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed("/register");
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSocialButton(String imagePath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: Get.width * 0.18,
      height: Get.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black.withOpacity(0.2))),
      child: Image.asset(imagePath),
    ),
  );
}
