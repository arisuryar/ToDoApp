import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/controllers/auth_controller.dart';
import 'package:to_do_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:to_do_app/app/widgets/app_button.dart';
import 'package:to_do_app/app/widgets/app_text.dart';
import 'package:to_do_app/app/widgets/app_textform.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final globalKey = GlobalKey<FormState>();

  final controller = Get.put(SignupController());

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: globalKey,
        child: Obx(() => Column(
              children: [
                AppTextForm(
                  label: 'Name',
                  controller: controller.nameC,
                  keyboardType: TextInputType.name,
                  validator: (value) => controller.validatorName(value!),
                  onChanged: (value) {
                    controller.isNameValid.value = value;
                  },
                ),
                AppTextForm(
                  label: 'Email',
                  controller: controller.emailC,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => controller.validatorEmail(value!),
                  onChanged: (value) {
                    controller.isEmailValid.value = value;
                  },
                ),
                AppTextForm(
                  label: 'Password',
                  controller: controller.passC,
                  obscureText: controller.obscureText.value,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.disabled,
                  onChanged: (value) {
                    controller.isPasswordValid.value = value;
                  },
                  validator: (value) => controller.validatorPassword(value!),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.obscureText.toggle(),
                    child: Icon(
                      controller.obscureText.isTrue
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.greyLine,
                    ),
                  ),
                ),
                AppTextForm(
                  label: 'Konfirmasi Password',
                  controller: controller.conpassC,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.obscureTextConpass.value,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.disabled,
                  onChanged: (value) {
                    controller.isConPassValid.value = value;
                  },
                  validator: (value) => controller.validatorConPassword(value!),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.obscureTextConpass.toggle(),
                    child: Icon(
                      controller.obscureTextConpass.isTrue
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.greyLine,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  label: authController.isLoading.isTrue
                      ? 'Loading...'
                      : 'Register',
                  onPressed: controller.enableButton.isTrue
                      ? () {
                          controller.signup(globalKey);
                          authController.signup(controller.nameC.text,
                              controller.emailC.text, controller.passC.text);
                        }
                      : null,
                  fixedSize: Size(Get.width, 56),
                  color: controller.enableButton.isTrue
                      ? AppColors.white
                      : AppColors.greyLine,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width / 2.5,
                      color: AppColors.greyLine,
                      height: 1,
                    ),
                    AppText(
                        text: 'Or', textSize: 16, color: AppColors.greyLine),
                    Container(
                      width: Get.width / 2.5,
                      color: AppColors.greyLine,
                      height: 1,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
