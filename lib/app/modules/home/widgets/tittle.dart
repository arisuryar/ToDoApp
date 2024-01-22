import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/home/controllers/home_controller.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TittleWidget extends StatelessWidget {
  const TittleWidget({
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
          text: ' Tittle',
          color: AppColors.secondary,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.tittleC,
          textInputAction: TextInputAction.next,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: 'Tittle',
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
