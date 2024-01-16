import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/modules/signup/components/signup_form.dart';
import 'package:to_do_app/app/modules/signup/components/signup_footer.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            AppText(
              text: 'Register',
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              textSize: 42,
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
