import 'package:flutter/material.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/modules/login/components/login_form.dart';

import 'package:get/get.dart';
import 'package:to_do_app/app/modules/login/components/login_header.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            const SizedBox(height: 40),
            AppText(
              text: 'Login',
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              textSize: 42,
            ),
            const SizedBox(height: 50),
            LoginForm(),
            const SizedBox(height: 30),
            const LoginHeader(),
          ],
        ),
      ),
    );
  }
}
