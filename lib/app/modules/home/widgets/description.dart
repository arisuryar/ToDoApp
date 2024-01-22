import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/home/controllers/home_controller.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: ' Description',
          color: AppColors.secondary,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.descriptionC,
          textInputAction: TextInputAction.newline,
          maxLines: 10,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: 'Description',
            hintStyle: GoogleFonts.poppins(
              color: AppColors.greyLine,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyLine, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyLine, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.secondary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
