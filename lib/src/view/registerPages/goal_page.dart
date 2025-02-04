import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnest_app/common/constants/app_image.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_button.dart';
import '../../themes/color_scheme.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  List goalArr=[
    {'image':AppImage.goal1Image,"title":"Improve Shape",'subtitle':"I have a low amount of body fat\nand need / want to build more\nmuscle"},
    {'image':AppImage.goal2Image,"title":"Lean & Tone",'subtitle':"I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"},
    {'image':AppImage.goal3Image,"title":"Lose a Fat",'subtitle':"I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).onPrimary,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items:goalArr.map(
                    (gObj) => Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                colorScheme(context).primary,
                                colorScheme(context).secondary
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.symmetric(
                          vertical: Get.width * 0.05, horizontal: 25),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              gObj['image'].toString(),
                              width: Get.width * 0.6,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Text(gObj["title"].toString(),
                                textAlign: TextAlign.center,
                                style: textTheme(context).bodyMedium?.copyWith(
                                    color: lightColorScheme.onPrimary,
                                    fontSize: 24)),
                            Container(
                              width: Get.width * 0.2,
                              height: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Text(gObj["subtitle"].toString(),
                                textAlign: TextAlign.center,
                                style: textTheme(context).titleSmall?.copyWith(
                                    color: lightColorScheme.onPrimary,

                                    fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 0.73,
                initialPage: 0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text("What is your goal?",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(color: lightColorScheme.onSecondary)),
                Text("It will help us to choose a best\nprogram for you",
                    textAlign: TextAlign.center,
                    style: textTheme(context).titleSmall?.copyWith(
                        color: lightColorScheme.onSecondary.withOpacity(0.6),
                        fontSize: 12)),
                const Spacer(),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                CustomButton(
                  pressed: () {
                    Get.toNamed("/login",);
                  },
                  text: "Confirm",
                  width: Get.width * 0.8,
                  height: Get.height * 0.064,
                  gradient: LinearGradient(colors: [
                    colorScheme(context).primary,
                    colorScheme(context).secondary
                  ]),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
