import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/login/controllers/login_controller.dart';
import 'package:ToDoApp/app/widgets/app_button.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:ToDoApp/app/widgets/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: controller.globalKey,
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
                const SizedBox(height: 20),
                AppButton(
                  label: controller.isLoading.isTrue ? 'Loading...' : 'Login',
                  onPressed: controller.enableButton.isTrue
                      ? () => controller.login(controller.globalKey)
                      : null,
                  fixedSize: Size(Get.width, 56),
                  color: controller.enableButton.isTrue
                      ? AppColors.white
                      : AppColors.greyLine,
                ),
              ],
            )),
      ),
    );
  }
}
