import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final authController = Get.find<AuthController>();

  CollectionReference<Map<String, dynamic>> collectionUser =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot<Map<String, dynamic>>> get streamTask => collectionUser
      .doc(authController.currentUserNow!.uid)
      .collection('task')
      .where('isCompleted', isEqualTo: true)
      .snapshots();
}
