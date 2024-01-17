import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/controllers/auth_controller.dart';
import 'package:to_do_app/app/utils/splashscreen.dart';
import 'package:to_do_app/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<User?>(
            stream: authController.streamUser,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                print(snapshot.data);
                return GetMaterialApp(
                  title: "Application",
                  initialRoute: snapshot.data != null &&
                          snapshot.data!.emailVerified == true
                      ? Routes.HOME
                      : Routes.LOGIN,
                  getPages: AppPages.routes,
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: AppColors.blackBackground,
                        background: AppColors.blackBackground),
                    useMaterial3: true,
                    textTheme: GoogleFonts.poppinsTextTheme(
                        Theme.of(context).textTheme),
                    appBarTheme: AppBarTheme(
                      scrolledUnderElevation: 0,
                      elevation: 0,
                      titleTextStyle: GoogleFonts.quicksand(
                        color: AppColors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      iconTheme: const IconThemeData(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              }
              return const SplashScreen();
            },
          );
        }
        return const SplashScreen();
      },
    );
  }
}
