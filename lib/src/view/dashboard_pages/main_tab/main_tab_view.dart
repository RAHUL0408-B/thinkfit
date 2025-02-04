import 'package:fitnest_app/common/constants/app_icon.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/src/view/dashboard_pages/main_tab/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../view_model/main_tab_controller.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  final MainTabController controller = Get.find();

  final List<Widget> _pages = [
    const HomeView(),
    const Center(
      child: Text("View Page"),
    ),
    const Center(
      child: Text("Inbox Page"),
    ),
    const Center(
      child: Text("Profile Page"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme(context).onPrimary,
        body: Obx(() => _pages[controller.selected.value]),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                colorScheme(context).primary,
                colorScheme(context).secondary
              ], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Optional: Adds spacing between FAB and gradient border
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              // Your action
            },
            elevation: 0,
            child: SvgPicture.asset(
              AppIcon.search,
              width: 23,
              height: 23,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => SizedBox(
            height: 80,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: colorScheme(context).onPrimary,
              currentIndex: controller.selected.value,
              onTap: controller.onItemTap,
              items: [
                BottomNavigationBarItem(
                  icon: GradientIcon(
                    AppIcon.home,
                    width: 30,
                    height: 30,
                    isSelected: controller.selected.value == 0,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                    icon: GradientIcon(
                      AppIcon.activity,
                      width: 30,
                      height: 30,
                      isSelected: controller.selected.value == 1,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: GradientIcon(
                      AppIcon.camera,
                      width: 30,
                      height: 30,
                      isSelected: controller.selected.value == 2,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: GradientIcon(
                      AppIcon.profile,
                      width: 30,
                      height: 30,
                      isSelected: controller.selected.value == 3,
                    ),
                    label: ""),
              ],
            ),
          ),
        ));
  }
}

class GradientIcon extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final bool isSelected;

  const GradientIcon(
    this.assetPath, {
    super.key,
    required this.width,
    required this.height,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      // Apply gradient for selected item
      return ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            colorScheme(context).primary,
            colorScheme(context).surface
          ], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: SvgPicture.asset(
          assetPath,
          width: width,
          height: height,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      );
    } else {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      );
    }
  }
}
