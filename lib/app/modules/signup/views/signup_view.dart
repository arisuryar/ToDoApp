import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/signup/components/signup_footer.dart';
import 'package:ToDoApp/app/modules/signup/components/signup_form.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Container(
              alignment: Alignment.center,
              child: AppText(
                text: 'Register',
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                textSize: 28,
              ),
            ),
            const SizedBox(height: 30),
            SignUpForm(),
            const SizedBox(height: 30),
            const SignUpFooter(),
          ],
        ),
      ),
    );
  }
}
