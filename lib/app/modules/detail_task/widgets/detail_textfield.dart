// ignore_for_file: must_be_immutable

import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTextField extends StatelessWidget {
  DetailTextField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
  });

  TextEditingController? controller;
  String label;
  int? maxLines;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          color: AppColors.primary,
          textSize: 16,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          textInputAction: textInputAction,
          maxLines: maxLines,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: label,
            hintStyle: GoogleFonts.poppins(
              fontSize: 16,
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
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
