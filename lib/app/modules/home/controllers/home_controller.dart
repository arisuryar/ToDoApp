import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/controllers/auth_controller.dart';
import 'package:to_do_app/app/controllers/task_controller.dart';

class HomeController extends GetxController {
  TextEditingController tittleC = TextEditingController();
  TextEditingController categoryC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  var dateTime = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  var formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  final authController = Get.find<AuthController>();
  final taskController = Get.put(TaskController());

  CollectionReference<Map<String, dynamic>> collectionUser =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot<Map<String, dynamic>>> get streamTask => collectionUser
      .doc(authController.currentUserNow!.uid)
      .collection('task')
      .snapshots();

  DateTime? initialDate = DateTime.now();
  var selectedDate = ''.obs;

  String selectDate(DateTime dateTime) {
    initialDate = dateTime;
    return selectedDate.value =
        DateFormat('EEEE, d MMMM yyyy').format(initialDate!);
  }

  TimeOfDay? initialTime = TimeOfDay.now();
  var selectedTime = ''.obs;

  String selectTime(TimeOfDay timeOfDay) {
    // initialDate = timeDate;
    return selectedTime.value =
        '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  }

  bool get isValid {
    if (tittleC.text.isNotEmpty &&
        categoryC.text.isNotEmpty &&
        descriptionC.text.isNotEmpty &&
        selectedDate.isNotEmpty &&
        selectedTime.isNotEmpty) {
      return true;
    }
    return false;
  }

  void validationSubmit() async {
    if (isValid == true) {
      taskController.addTask(
        tittle: tittleC.text,
        category: categoryC.text,
        description: descriptionC.text,
        deadlineDate: selectedDate.value,
        deadlineTime: selectedTime.value,
        isCompleted: false,
        createdAt: '$dateTime $formattedTime',
        image: 'Testing',
      );
      await Get.defaultDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.blackTextField,
        title: 'Berhasil',
        titleStyle: GoogleFonts.poppins(
            color: AppColors.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        titlePadding: const EdgeInsets.only(top: 15),
        middleText: 'Berhasil menambahkan task',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      );
      tittleC.clear();
      categoryC.clear();
      descriptionC.clear();
      selectedDate.value = '';
      selectedTime.value = '';
    } else {
      Get.defaultDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.blackTextField,
        title: 'Gagal',
        titleStyle: GoogleFonts.poppins(
            color: AppColors.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        titlePadding: const EdgeInsets.only(top: 15),
        middleText: 'Tidak boleh ada yang kosong, semua wajib diisi',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      );
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tittleC.dispose();
    categoryC.dispose();
    descriptionC.dispose();
    super.onClose();
  }
}
