import 'package:flutter/material.dart';
import 'package:to_do_app/app/constants/color.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String label;
  void Function()? onPressed;
  Size? fixedSize;
  Color? color;

  AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fixedSize,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize,
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.primaryDisabled.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style:
            TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
