import 'package:ToDoApp/app/constants/assets.dart';
import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.blackBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsString.iconLogo),
              AppText(
                text: 'ToDoApp',
                color: AppColors.white,
                textSize: 26,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              AppText(
                text: 'The best to do list application for you',
                color: AppColors.white,
                textSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
