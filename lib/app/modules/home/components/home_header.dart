import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/controllers/auth_controller.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

final authController = Get.find<AuthController>();

AppBar homeHeader = AppBar(
  title: AppText(
      text: 'ToDoApp',
      color: AppColors.white,
      textSize: 24,
      fontWeight: FontWeight.w600),
  backgroundColor: AppColors.blackBackground,
  actions: [
    GestureDetector(
        onTap: () => authController.signout(),
        child: const Icon(Icons.account_circle, size: 34)),
    const SizedBox(width: 20),
  ],
);