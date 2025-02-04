import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).onPrimary,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: RichText(
                    text: TextSpan(
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(color: colorScheme(context).onSecondary),
                        children: [
                  const TextSpan(
                    text: "Fitnest",
                  ),
                  TextSpan(
                      text: "X",
                      style: textTheme(context).bodyLarge?.copyWith(
                          color: colorScheme(context).primary, fontSize: 40)),
                ]))),
            Text(
              "Everybody Can Train",
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: colorScheme(context).onSecondary.withOpacity(0.4),
              ),
            ),
            SizedBox(
              height: Get.height * 0.3,
            ),
            CustomButton(
              pressed: () {
                  Get.offNamed("/onboard");
              },
              text: "Get Started",
              width: Get.width * 0.7,
              height: Get.height * 0.064,
              gradient: LinearGradient(colors: [
                colorScheme(context).primary,
                colorScheme(context).secondary
              ]),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
