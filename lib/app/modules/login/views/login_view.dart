import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/login/components/login_footer.dart';
import 'package:ToDoApp/app/modules/login/components/login_form.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Container(
              alignment: Alignment.center,
              child: AppText(
                text: 'Login',
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                textSize: 28,
              ),
            ),
            const SizedBox(height: 30),
            LoginForm(),
            const SizedBox(height: 30),
            const LoginFooter(),
          ],
        ),
      ),
    );
  }
}
