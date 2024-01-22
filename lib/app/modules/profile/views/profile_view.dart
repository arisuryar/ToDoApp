import 'dart:io';

import 'package:ToDoApp/app/constants/assets.dart';
import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:ToDoApp/app/routes/app_pages.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();
  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackBackground,
        title: AppText(
            text: 'Profile',
            color: AppColors.white,
            textSize: 22,
            fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<ProfileController>(
              builder: (c) => c.pickImage != null
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4, color: AppColors.primary),
                              borderRadius: BorderRadius.circular(128)),
                          child: Container(
                            width: 128,
                            height: 128,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(128),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(c.pickImage!.path),
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            AppText(
                                text:
                                    authController.currentUserNow!.displayName!,
                                color: AppColors.white,
                                textSize: 18,
                                fontWeight: FontWeight.w600),
                            const SizedBox(height: 5),
                            AppText(
                                text: authController.currentUserNow!.email!,
                                color: AppColors.greyLine,
                                textSize: 14),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => c.resetImage(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.cancel,
                                            color: Colors.white, size: 18),
                                        AppText(
                                            text: 'Cancel',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () => c
                                      .uploadImage(
                                          authController.currentUserNow!.uid)
                                      .then((value) {
                                    if (value != null) {
                                      authController.updatePhotoUrl(value);
                                    }
                                  }),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.download_rounded,
                                            color: Colors.white, size: 18),
                                        AppText(
                                            text: 'Save',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4, color: AppColors.primary),
                              borderRadius: BorderRadius.circular(128)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(128),
                            child: authController.currentUserNow!.photoURL ==
                                    null
                                ? Image.asset(
                                    AssetsString.imageProfile,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    authController.currentUserNow!.photoURL!,
                                    fit: BoxFit.cover,
                                    width: 128,
                                    height: 128,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AppText(
                            text: authController.currentUserNow!.displayName!,
                            color: AppColors.white,
                            textSize: 20,
                            fontWeight: FontWeight.w600),
                        const SizedBox(height: 5),
                        AppText(
                            text: authController.currentUserNow!.email!,
                            color: AppColors.greyLine,
                            textSize: 14),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => c.selectImage(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.upload_rounded,
                                        color: Colors.white, size: 18),
                                    AppText(
                                        text: 'Upload Picture',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
          const SizedBox(height: 50),
          ListTile(
            onTap: () => Get.toNamed(Routes.HISTORY),
            leading: const Icon(
              Icons.task_rounded,
              color: AppColors.secondary,
            ),
            title: AppText(
              text: 'Task Done',
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: AppColors.white,
            ),
          ),
          ListTile(
            onTap: () => authController.signout(),
            leading: const Icon(
              Icons.logout_outlined,
              color: AppColors.secondary,
            ),
            title: AppText(
              text: 'Logout',
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
