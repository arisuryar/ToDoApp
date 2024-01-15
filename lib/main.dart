import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/utils/splashscreen.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: Future.delayed(const Duration(seconds: 1)),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.blackBackground,
            background: AppColors.blackBackground),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
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
    //     }
    //     return const SplashScreen();
    //   },
    // );
  }
}
