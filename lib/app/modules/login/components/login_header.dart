import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/assets.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/widgets/app_button_outlined.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          AppButtonOutlined(
            label: 'Login with Google',
            fixedSize: Size(Get.width, 56),
            withAssets: true,
            stringAssets: AssetsString.iconGoogle,
            onPressed: () {},
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  text: 'Don’t have an account ?',
                  color: AppColors.greyLine,
                  fontWeight: FontWeight.w400,
                  textSize: 14.0),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => print('Signup'),
                child: AppText(
                    text: 'Register',
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                    textSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
