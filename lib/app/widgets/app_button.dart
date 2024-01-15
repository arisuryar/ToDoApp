import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/constants/color.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String label;
  void Function()? onPressed;
  Size? fixedSize;
  Color? color;
  Color? backgroundColor;

  AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fixedSize,
    this.color,
    this.backgroundColor = AppColors.primary,
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
            color: color, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
