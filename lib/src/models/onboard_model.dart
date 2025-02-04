

import 'package:fitnest_app/common/constants/app_image.dart';

class OnBoardingInfo {
  final String title;
  final String descriptions;
  final String image;

  OnBoardingInfo({required this.title,required this.image,required this.descriptions});
}

class OnboardingItems{
  List<OnBoardingInfo> items=[
    OnBoardingInfo(title:"Track Your Goal",
        image: AppImage.goalImage, descriptions: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"),

    OnBoardingInfo(title:"Get Burn",
        image: AppImage.burnImage, descriptions: "Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever"),

    OnBoardingInfo(title:"Eat Well",
        image: AppImage.eatImage, descriptions: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"),

    OnBoardingInfo(title:"Improve Sleep  Quality",
        image: AppImage.exerciseImage, descriptions: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning"),
  ];
}