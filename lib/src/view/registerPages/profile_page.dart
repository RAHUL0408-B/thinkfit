import 'package:fitnest_app/common/constants/app_image.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/src/view_model/register/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../common/constants/validation.dart';
import '../../../common/constants/app_icon.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../themes/color_scheme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController date = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  final ProfileController controller = Get.find();

  //Go to next page logic

  void next() {
    if (date.text.isNotEmpty &&
        weight.text.isNotEmpty &&
        height.text.isNotEmpty &&
        controller.selectedGender.value.isNotEmpty) {
      Get.toNamed("/goal"/*, arguments: {
        'gender': controller.selectedGender.value,
        'dob': date.text,
        'weight': weight.text,
        'height': height.text,
      }*/);
    } else {
      print("Please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme(context).onPrimary,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Image.asset(
                AppImage.profileImage,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text("Let’s complete your profile",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: lightColorScheme.onSecondary)),
              Text("It will help us to know more about you!",
                  style: textTheme(context).titleSmall?.copyWith(
                      color: lightColorScheme.onSecondary.withOpacity(0.6),
                      fontSize: 12)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1,
                  vertical: Get.height * 0.02,
                ),
                child: Column(
                  children: [
                    Obx(
                      () => DropdownButtonFormField(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AppIcon.user,
                              fit: BoxFit.cover,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Choose Gender",
                          hintStyle: textTheme(context).titleSmall?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        dropdownColor: Colors.white,
                        value: controller.selectedGender.value.isEmpty
                            ? null
                            : controller.selectedGender.value,
                        items: <String>['Female', 'Male', 'Other']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: textTheme(context).titleSmall?.copyWith(
                                  color: lightColorScheme.onSecondary
                                      .withOpacity(0.6),
                                  fontSize: 12),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          print('New Value: $newValue');
                          controller.selectedGender.value = newValue ?? '';
                        },
                      ),
                    ),
                    CustomTextField(
                      icon: SvgPicture.asset(
                        AppIcon.calendar,
                        fit: BoxFit.contain,
                      ),
                      hintText: "Date of Birth",
                      controller: date,
                      validator: validateField,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            icon: SvgPicture.asset(
                              AppIcon.weight,
                              fit: BoxFit.contain,
                            ),
                            hintText: "Your Weight",
                            controller: weight,
                            validator: validateField,
                          ),
                        ),
                        Container(
                          width: Get.width * 0.15,
                          height: Get.height * 0.065,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    colorScheme(context).surface,
                                    colorScheme(context).onSurface,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "KG",
                            style: textTheme(context)
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            icon: SvgPicture.asset(
                              AppIcon.swap,
                              fit: BoxFit.contain,
                            ),
                            hintText: "Your Height",
                            controller: height,
                            validator: validateField,
                          ),
                        ),
                        Container(
                          width: Get.width * 0.15,
                          height: Get.height * 0.065,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    colorScheme(context).surface,
                                    colorScheme(context).onSurface,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "CM",
                            style: textTheme(context)
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomButton(
                pressed: () {
                  next();
                },
                text: "Next >",
                width: Get.width * 0.8,
                height: Get.height * 0.064,
                gradient: LinearGradient(colors: [
                  colorScheme(context).primary,
                  colorScheme(context).secondary
                ]),
              ),
            ],
          )),
        ));
  }
}
