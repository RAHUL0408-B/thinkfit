import 'package:fitnest_app/src/routes/app_pages.dart';
import 'package:fitnest_app/src/routes/route.dart';
import 'package:fitnest_app/src/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: MyAppRouts.splashPage,
      getPages: AppPage.pages,
      theme: appTheme(context),
    );
  }
}
