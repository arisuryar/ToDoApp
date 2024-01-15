import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController conpassC = TextEditingController();

  var obscureText = true.obs;
  var obscureTextConpass = true.obs;
  var isNameValid = ''.obs;
  var isEmailValid = ''.obs;
  var isPasswordValid = ''.obs;
  var isConPassValid = ''.obs;

  RxBool get enableButton {
    if (isEmailValid.value.isNotEmpty &&
        isPasswordValid.value.isNotEmpty &&
        isNameValid.value.isNotEmpty &&
        isConPassValid.value.isNotEmpty) {
      return true.obs;
    }
    return false.obs;
  }

  String? validatorName(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
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

  String? validatorConPassword(String value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value != isPasswordValid.value) {
      return 'Konfirmasi password berbeda';
    }
    return null;
  }

  void signup(GlobalKey<FormState> globalKey) {
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
