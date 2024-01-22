import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:ToDoApp/app/routes/app_pages.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final authController = Get.find<AuthController>();

AppBar homeHeader = AppBar(
  title: AppText(
      text: 'ToDoApp',
      color: AppColors.white,
      textSize: 22,
      fontWeight: FontWeight.w600),
  backgroundColor: AppColors.blackBackground,
  actions: [
    GestureDetector(
        onTap: () => Get.toNamed(Routes.PROFILE),
        child: const Icon(Icons.account_circle)),
    const SizedBox(width: 20),
  ],
);
