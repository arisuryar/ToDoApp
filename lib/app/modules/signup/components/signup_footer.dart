import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
            text: 'Already have an account ?',
            color: AppColors.greyLine,
            fontWeight: FontWeight.w400),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => Get.back(),
          child: AppText(
              text: 'Login',
              color: AppColors.secondary,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
