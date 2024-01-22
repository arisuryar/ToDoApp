import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isLoading = false.obs;
  var obscureText = false.obs;
  var isEmailValid = ''.obs;
  var isPasswordValid = ''.obs;

  RxBool get enableButton {
    if (isEmailValid.value.isNotEmpty && isPasswordValid.value.isNotEmpty) {
      return true.obs;
    }
    return false.obs;
  }

  String? validatorEmail(String value) {
    if (value == '' || value.isEmpty) {
      return 'Please enter some text';
    } else if (!value.isEmail) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value == '' || value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length < 6) {
      return 'Password kurang dari 6 huruf';
    }
    return null;
  }

  void login(GlobalKey<FormState> globalKey) async {
    if (globalKey.currentState!.validate() == true) {
      isLoading.toggle();
      await authController.login(emailC.text, passC.text);
      isLoading.toggle();
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }
}
