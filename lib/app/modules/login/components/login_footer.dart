import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/routes/app_pages.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
            text: 'Don’t have an account ?',
            color: AppColors.greyLine,
            fontWeight: FontWeight.w400),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.SIGNUP),
          child: AppText(
              text: 'Register',
              color: AppColors.secondary,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
