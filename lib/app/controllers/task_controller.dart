import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/controllers/auth_controller.dart';
import 'package:to_do_app/app/data/models/task_model.dart';

class TaskController extends GetxController {
  var authC = Get.find<AuthController>();

  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance.collection('users');

  Rx<Task> taskModel = Task().obs;

  void addTask({
    required String tittle,
    required String description,
    required String category,
    required String deadlineDate,
    required String deadlineTime,
    required String createdAt,
    required bool isCompleted,
    required String image,
  }) async {
    final dataTask = taskModel(Task(
        tittle: tittle,
        description: description,
        category: category,
        deadlineDate: deadlineDate,
        deadlineTime: deadlineTime,
        createdAt: createdAt,
        isCompleted: isCompleted,
        image: image));

    await firebaseFirestore
        .doc(authC.currentUserNow!.uid)
        .collection('task')
        .doc(dataTask.tittle)
        .set({
      "tittle": dataTask.tittle,
      "description": dataTask.description,
      "category": dataTask.category,
      "deadlineDate": dataTask.deadlineDate,
      "deadlineTime": dataTask.deadlineTime,
      "createdAt": dataTask.createdAt,
      "isCompleted": dataTask.isCompleted,
      "image": dataTask.image,
    });
  }
}
