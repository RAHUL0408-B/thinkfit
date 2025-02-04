import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController{

  //Page Controller
  PageController pageController = PageController(initialPage: 0);

  RxInt currentIndex=0.obs;
  RxDouble percentage=0.25.obs;

// Method to handle page changes
  void onPageChanged(int index, int totalPages){
    if(index > currentIndex.value ){
      percentage.value=(index +1)/totalPages;
    }else{
      percentage.value=(index +1)/totalPages;
    }
    currentIndex.value=index;
  }

  // Navigate to the next page
  void nextPage() {
    if (currentIndex.value < 3) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // Handle last page logic here
      Get.offNamed("/register");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}

