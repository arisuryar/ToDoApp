import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/app/constants/color.dart';

// ignore: must_be_immutable
class AppButtonOutlined extends StatelessWidget {
  Size? fixedSize;
  final String label;
  String? stringAssets;
  bool? withAssets;
  void Function()? onPressed;

  AppButtonOutlined({
    super.key,
    this.fixedSize,
    required this.label,
    this.withAssets = false,
    this.stringAssets,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: AppColors.primary),
        fixedSize: fixedSize,
      ),
      child: withAssets == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(stringAssets!),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          : Text(
              label,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
    );
  }
}
