import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:ToDoApp/app/controllers/task_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTaskController extends GetxController {
  final authController = Get.find<AuthController>();
  final taskController = Get.find<TaskController>();

  var isEdit = false.obs;

  CollectionReference<Map<String, dynamic>> collectionUser =
      FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot<Map<String, dynamic>>> getTask(String uid) async {
    final docSnap = await collectionUser
        .doc(authController.currentUserNow!.uid)
        .collection('task')
        .doc(uid)
        .get();

    return docSnap;
  }

  TextEditingController tittleC = TextEditingController();
  TextEditingController categoryC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  var selectedDate = ''.obs;
  var selectedTime = ''.obs;
}
