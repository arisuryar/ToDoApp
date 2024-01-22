import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/data/models/users_model.dart';
import 'package:ToDoApp/app/routes/app_pages.dart';
import 'package:ToDoApp/app/widgets/app_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<User?> get streamUser => firebaseAuth.authStateChanges();

  User? get currentUserNow => firebaseAuth.currentUser;

  Rx<Users> userModel = Users().obs;

  var dateTime = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  var formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  var isLoading = false.obs;

  void updatePhotoUrl(String url) async {
    Get.dialog(
        const Center(
            child: CircularProgressIndicator(color: AppColors.primary)),
        barrierDismissible: false);

    CollectionReference users = firebaseFirestore.collection('users');

    await users.doc(currentUserNow!.uid).update({'photoUrl': url});
    await currentUserNow!.updatePhotoURL(url);

    userModel.update((user) {
      user!.photoUrl = url;
    });
    currentUserNow!.reload();
    userModel.refresh();
    Get.back();
    Get.defaultDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: AppColors.blackTextField,
      title: 'Berhasil',
      titleStyle: GoogleFonts.poppins(
          color: AppColors.secondary,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      titlePadding: const EdgeInsets.only(top: 15),
      middleText: 'Ganti photo profile berhasil.',
      middleTextStyle: GoogleFonts.poppins(
          color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  // Login
  Future<void> login(String email, String password) async {
    Get.dialog(
        const Center(
            child: CircularProgressIndicator(color: AppColors.primary)),
        barrierDismissible: false);
    userModel.update((userModel) {
      userModel!.lastSignIn = '$dateTime $formattedTime';
    });
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.emailVerified == true) {
        await firebaseFirestore
            .collection('users')
            .doc(currentUserNow!.uid)
            .update({
          "lastSignIn": userModel.value.lastSignIn,
        });

        await Future.delayed(const Duration(seconds: 5));

        Get.back();
        Get.offAllNamed(Routes.HOME);
      } else {
        await Future.delayed(const Duration(seconds: 5));

        Get.back();
        Get.defaultDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: AppColors.blackTextField,
          title: 'Verification Email',
          titleStyle: GoogleFonts.poppins(
              color: AppColors.secondary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          titlePadding: const EdgeInsets.only(top: 15),
          middleText:
              'Anda belum melakukan verifikasi email, apakah anda ingin dikirimkan email verifikasi ulang?',
          middleTextStyle: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          confirm: AppButton(
            label: 'Ya',
            fixedSize: const Size(85, 40),
            color: AppColors.white,
            onPressed: () async {
              await userCredential.user!.sendEmailVerification();
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
                middleText: 'Kami telah mengirimkan email verifikasi',
                middleTextStyle: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              );
            },
          ),
          cancel: AppButton(
            label: 'Tidak',
            fixedSize: const Size(85, 40),
            color: AppColors.white,
            onPressed: () => Get.back(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        await Future.delayed(const Duration(seconds: 5));

        Get.back();
        Get.defaultDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: AppColors.blackTextField,
          title: 'Terjadi Kesalahan',
          titleStyle: GoogleFonts.poppins(
              color: AppColors.secondary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          titlePadding: const EdgeInsets.only(top: 15),
          middleText: 'Email atau Password yang anda masukkan salah',
          middleTextStyle: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        );
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 5));

      Get.back();
      Get.defaultDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.blackTextField,
        title: 'Terjadi Kesalahan',
        titleStyle: GoogleFonts.poppins(
            color: AppColors.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        titlePadding: const EdgeInsets.only(top: 15),
        middleText: 'Tidak dapat Login',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      );
    }
  }

  Future<void> signup(String name, String email, String password) async {
    Get.dialog(
        const Center(
            child: CircularProgressIndicator(color: AppColors.primary)),
        barrierDismissible: false);
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);

      final dataUser = userModel(Users(
        uid: currentUserNow!.uid,
        name: currentUserNow!.displayName,
        email: currentUserNow!.email,
        createdAt: '$dateTime $formattedTime',
        lastSignIn: '$dateTime $formattedTime',
        photoUrl: currentUserNow!.photoURL,
        provider: 'Email & Password',
      ));

      await firebaseFirestore.collection('users').doc(dataUser.uid).set({
        'uid': dataUser.uid,
        'name': dataUser.name,
        'email': dataUser.email,
        'createdAt': dataUser.createdAt,
        'lastSignIn': dataUser.lastSignIn,
        'photoUrl': dataUser.photoUrl,
        'provider': dataUser.provider,
      });

      await userCredential.user!.sendEmailVerification();

      await Future.delayed(const Duration(seconds: 5));

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
        middleText:
            'Registrasi akun berhasil, silahkan cek email untuk melakukan verifikasi.',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await Future.delayed(const Duration(seconds: 5));

        Get.back();
        Get.defaultDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: AppColors.blackTextField,
          title: 'Terjadi Kesalahan',
          titleStyle: GoogleFonts.poppins(
              color: AppColors.secondary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          titlePadding: const EdgeInsets.only(top: 15),
          middleText: 'Password yang anda masukkan terlalu lemah',
          middleTextStyle: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        );
      } else if (e.code == 'email-already-in-use') {
        await Future.delayed(const Duration(seconds: 5));

        Get.back();
        Get.defaultDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: AppColors.blackTextField,
          title: 'Terjadi Kesalahan',
          titleStyle: GoogleFonts.poppins(
              color: AppColors.secondary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          titlePadding: const EdgeInsets.only(top: 15),
          middleText: 'Email yang anda registrasi telah terdaftar',
          middleTextStyle: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        );
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 5));

      Get.back();
      Get.defaultDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.blackTextField,
        title: 'Terjadi Kesalahan',
        titleStyle: GoogleFonts.poppins(
            color: AppColors.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        titlePadding: const EdgeInsets.only(top: 15),
        middleText: 'Tidak dapat Login',
        middleTextStyle: GoogleFonts.poppins(
            color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      );
    }
  }

  void signout() async {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: AppColors.blackTextField,
      title: 'Keluar',
      titleStyle: GoogleFonts.poppins(
          color: AppColors.secondary,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      titlePadding: const EdgeInsets.only(top: 15),
      middleText: 'Apakah anda yakin ingin keluar?',
      middleTextStyle: GoogleFonts.poppins(
          color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      confirm: AppButton(
        label: 'Ya',
        fixedSize: const Size(85, 40),
        color: AppColors.white,
        onPressed: () async {
          Get.dialog(
              const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
              barrierDismissible: false);
          await Future.delayed(const Duration(seconds: 5));

          await firebaseAuth.signOut();
          Get.offAllNamed(Routes.LOGIN);
        },
      ),
      cancel: AppButton(
        label: 'Tidak',
        fixedSize: const Size(85, 40),
        color: AppColors.white,
        onPressed: () => Get.back(),
      ),
    );
  }
}
