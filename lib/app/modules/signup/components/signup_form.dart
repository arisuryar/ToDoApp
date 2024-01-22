import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/signup/controllers/signup_controller.dart';
import 'package:ToDoApp/app/widgets/app_button.dart';
import 'package:ToDoApp/app/widgets/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: controller.globalKey,
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
                  label:
                      controller.isLoading.isTrue ? 'Loading...' : 'Register',
                  onPressed: controller.enableButton.isTrue
                      ? () => controller.signup(controller.globalKey)
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
