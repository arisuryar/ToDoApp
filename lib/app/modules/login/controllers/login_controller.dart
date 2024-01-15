import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var obscureText = true.obs;
  var isEmailValid = ''.obs;
  var isPasswordValid = ''.obs;

  RxBool get enableButton {
    if (isEmailValid.value.isNotEmpty && isPasswordValid.value.isNotEmpty) {
      return true.obs;
    }
    return false.obs;
  }

  String? validatorEmail(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!value.isEmail) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length <= 6) {
      return 'Password kurang dari 6 huruf';
    }
    return null;
  }

  void login(GlobalKey<FormState> globalKey) {
    if (globalKey.currentState!.validate()) {
      print('sukkess');
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }
}
