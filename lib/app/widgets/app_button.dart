import 'package:ToDoApp/app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String label;
  void Function()? onPressed;
  Size? fixedSize;
  Color? color;
  Color? backgroundColor;
  double? fontSize;

  AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fixedSize,
    this.color,
    this.backgroundColor = AppColors.primary,
    this.fontSize = 16,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: AppColors.primaryDisabled.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
            color: color, fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
    );
  }
}
