import 'package:fitnest_app/common/constants/app_image.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/color_scheme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).onPrimary,
      body: SafeArea(child: Container(
        padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height:Get.height * 0.05 ,),
            Image.asset(AppImage.welcomeImage),
            SizedBox(height:Get.height * 0.03 ,),
            Text("Welcome, Stefani",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: lightColorScheme.onSecondary)),

            Text("You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: textTheme(context).titleSmall?.copyWith(
                    color: lightColorScheme.onSecondary.withOpacity(0.6),
                    fontSize: 12)),
            SizedBox(height:Get.height * 0.23 ,),
            CustomButton(
              pressed: () {
                Get.toNamed("/main");
              },
              text: "Go To Home",
              width: Get.width * 0.8,
              height: Get.height * 0.064,
              gradient: LinearGradient(colors: [
                colorScheme(context).primary,
                colorScheme(context).secondary
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
