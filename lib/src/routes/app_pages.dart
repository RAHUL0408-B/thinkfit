import 'package:fitnest_app/src/getx_binding/profie_binding.dart';
import 'package:fitnest_app/src/routes/route.dart';
import 'package:fitnest_app/src/view/registerPages/goal_page.dart';
import 'package:fitnest_app/src/view/registerPages/login_page.dart';
import 'package:fitnest_app/src/view/registerPages/profile_page.dart';
import 'package:fitnest_app/src/view/registerPages/welcome_page.dart';
import 'package:get/get.dart';
import '../getx_binding/binding.dart';
import '../getx_binding/main_tab_binding.dart';
import '../getx_binding/register_binding.dart';
import '../view/dashboard_pages/main_tab/main_tab_view.dart';
import '../view/onboarding_pages/onboard.dart';
import '../view/onboarding_pages/onboard_page.dart';
import '../view/registerPages/register_page.dart';
import 'error_route.dart';

class AppPage {
  static final pages = [
    GetPage(
        name: MyAppRouts.splashPage,
        page: () => const OnBoardPage(),
        transition: Transition.fade,
       ),
    GetPage(
        name: MyAppRouts.onboardPage,
        page: () => const OnboardViewPage(),
        transition: Transition.fade,
        binding: BoardBinding()),
    GetPage(
        name: MyAppRouts.registerPage,
        page: () => const RegisterPage(),
        transition: Transition.fade,
      binding: RegisterBinding(),
        ),
    GetPage(
      name: MyAppRouts.profilePage,
      page: () => const ProfilePage(),
      transition: Transition.fade,
      binding: ProfileBinding(),
    ),
    GetPage(
      name: MyAppRouts.goalPage,
      page: () => const GoalPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: MyAppRouts.welcomePage,
      page: () => const WelcomePage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: MyAppRouts.loginPage,
      page: () => const LoginPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: MyAppRouts.mainPage,
      page: () => const MainTabView(),
      transition: Transition.fade,
      binding: MainTabBinding(),
    ),
    GetPage(
        name: MyAppRouts.errorPage,
        page: () => const ErrorPage(),
        transition: Transition.fade),
  ];
}
