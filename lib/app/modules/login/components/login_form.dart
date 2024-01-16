import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/controllers/auth_controller.dart';
import 'package:to_do_app/app/modules/login/controllers/login_controller.dart';
import 'package:to_do_app/app/widgets/app_button.dart';
import 'package:to_do_app/app/widgets/app_text.dart';
import 'package:to_do_app/app/widgets/app_textform.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final globalKey = GlobalKey<FormState>();

  final controller = Get.put(LoginController());

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: globalKey,
        child: Obx(() => Column(
              children: [
                AppTextForm(
                  label: 'Email',
                  controller: controller.emailC,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => controller.validatorEmail(value!),
                  onChanged: (value) {
                    controller.isEmailValid.value = value;
                  },
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  label: 'Password',
                  controller: controller.passC,
                  textInputAction: TextInputAction.done,
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
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => print('Lupa password'),
                    child: AppText(
                        text: 'Forgot Password ? ',
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                        textSize: 14.0),
                  ),
                ),
                const SizedBox(height: 70),
                AppButton(
                  label:
                      authController.isLoading.isTrue ? 'Loading...' : 'Login',
                  onPressed: controller.enableButton.isTrue
                      ? () {
                          controller.login(globalKey);
                          authController.login(
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
