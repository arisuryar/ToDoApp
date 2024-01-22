import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:ToDoApp/app/data/models/task_model.dart';
import 'package:ToDoApp/app/widgets/app_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskController extends GetxController {
  var authC = Get.find<AuthController>();

  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance.collection('users');

  Rx<Task> taskModel = Task().obs;

  var isLoading = false.obs;

  Future<void> addTask(
      {required String tittle,
      required String description,
      required String category,
      required String deadlineDate,
      required String deadlineTime,
      required String createdAt,
      required bool isCompleted}) async {
    isLoading.value = true;
    if (isLoading.isTrue) {
      try {
        Get.dialog(
            const Center(
                child: CircularProgressIndicator(color: AppColors.primary)),
            barrierDismissible: false);
        final dataTask = taskModel(Task(
            tittle: tittle,
            description: description,
            category: category,
            deadlineDate: deadlineDate,
            deadlineTime: deadlineTime,
            createdAt: createdAt,
            isCompleted: isCompleted));
        await firebaseFirestore
            .doc(authC.currentUserNow!.uid)
            .collection('task')
            .add({
          "tittle": dataTask.tittle,
          "description": dataTask.description,
          "category": dataTask.category,
          "deadlineDate": dataTask.deadlineDate,
          "deadlineTime": dataTask.deadlineTime,
          "createdAt": dataTask.createdAt,
          "isCompleted": dataTask.isCompleted
        });
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;
        Get.back();
      } catch (err) {
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;
        Get.back();
      }
    }
  }

  void editTask(String docRef, String tittle, String description,
      String category, String deadlineDate, String deadlineTime) async {
    try {
      await firebaseFirestore
          .doc(authC.currentUserNow!.uid)
          .collection('task')
          .doc(docRef)
          .update({
        "tittle": tittle,
        "description": description,
        "category": category,
        "deadlineDate": deadlineDate,
        "deadlineTime": deadlineTime,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteTask(String docRef) async {
    try {
      Get.defaultDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.blackTextField,
        title: 'Delete Task',
        titleStyle: GoogleFonts.poppins(
            color: AppColors.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        titlePadding: const EdgeInsets.only(top: 15),
        middleText: 'Apakah anda yakin ingin menghapus task ini',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
        confirm: AppButton(
          label: 'Ya',
          fixedSize: const Size(85, 40),
          color: AppColors.white,
          onPressed: () async {
            await firebaseFirestore
                .doc(authC.currentUserNow!.uid)
                .collection('task')
                .doc(docRef)
                .delete();
            Get.back();
            Get.defaultDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: AppColors.blackTextField,
              title: 'Berhasil',
              titleStyle: GoogleFonts.poppins(
                  color: AppColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              titlePadding: const EdgeInsets.only(top: 15),
              middleText: 'Berhasil Menghapus Task',
              middleTextStyle: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            );
            await Future.delayed(const Duration(seconds: 2));
            Get.back();
            Get.back();
          },
        ),
        cancel: AppButton(
          label: 'Tidak',
          fixedSize: const Size(85, 40),
          color: AppColors.white,
          onPressed: () => Get.back(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void doneTask(String docRef) async {
    try {
      Get.defaultDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.blackTextField,
        title: 'Task Done',
        titleStyle: GoogleFonts.poppins(
            color: AppColors.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        titlePadding: const EdgeInsets.only(top: 15),
        middleText: 'Apakah task ini sudah selesai',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
        confirm: AppButton(
          label: 'Ya',
          fixedSize: const Size(85, 40),
          color: AppColors.white,
          onPressed: () async {
            await firebaseFirestore
                .doc(authC.currentUserNow!.uid)
                .collection('task')
                .doc(docRef)
                .update({
              'isCompleted': true,
            });
            Get.back();
            Get.defaultDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: AppColors.blackTextField,
              title: 'Berhasil',
              titleStyle: GoogleFonts.poppins(
                  color: AppColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              titlePadding: const EdgeInsets.only(top: 15),
              middleText: 'Berhasil selesaikan task',
              middleTextStyle: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            );
            await Future.delayed(const Duration(seconds: 2));
            Get.back();
            Get.back();
          },
        ),
        cancel: AppButton(
          label: 'Tidak',
          fixedSize: const Size(85, 40),
          color: AppColors.white,
          onPressed: () => Get.back(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
