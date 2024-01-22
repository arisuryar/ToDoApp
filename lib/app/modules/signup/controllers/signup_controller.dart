import 'package:ToDoApp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController conpassC = TextEditingController();

  var isLoading = false.obs;
  var obscureText = true.obs;
  var obscureTextConpass = true.obs;
  var isNameValid = ''.obs;
  var isEmailValid = ''.obs;
  var isPasswordValid = ''.obs;
  var isConPassValid = ''.obs;

  RxBool get enableButton {
    if (isEmailValid.value.isNotEmpty &&
        isNameValid.value.isNotEmpty &&
        isPasswordValid.value.length == isConPassValid.value.length) {
      return true.obs;
    }
    return false.obs;
  }

  String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!value.isEmail) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length <= 6) {
      return 'Password kurang dari 6 huruf';
    }
    return null;
  }

  String? validatorConPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value != isPasswordValid.value) {
      return 'Konfirmasi password berbeda';
    }
    return null;
  }

  void signup(GlobalKey<FormState> globalKey) async {
    if (globalKey.currentState!.validate() == true) {
      isLoading.toggle();
      await authController.signup(nameC.text, emailC.text, passC.text);
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
