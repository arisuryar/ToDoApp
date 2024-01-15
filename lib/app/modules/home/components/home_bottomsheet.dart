import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/widgets/app_button.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

Future<dynamic> homeBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: context.mediaQueryViewInsets.bottom,
      ),
      child: Container(
        height: Get.height * 0.70,
        decoration: const BoxDecoration(
          color: AppColors.blackTextField,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: ' Tittle',
                  color: AppColors.primary,
                  textSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    hintText: 'Tittle',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.greyLine,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.greyLine, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.greyLine, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: ' Description',
                  color: AppColors.primary,
                  textSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                TextField(
                  maxLines: 10,
                  style: const TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    hintText: 'Description',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.greyLine,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.greyLine, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.greyLine, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: ' Deadline',
                  color: AppColors.primary,
                  textSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.white,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    hintText: 'Deadline (Optional)',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.greyLine,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.greyLine, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.greyLine, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            AppButton(
                label: 'Add Task',
                onPressed: () {},
                fixedSize: Size(Get.width, 56),
                color: AppColors.white,
                backgroundColor: AppColors.primary),
          ],
        ),
      ),
    ),
  );
}
