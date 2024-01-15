import 'package:flutter/material.dart';
import 'package:to_do_app/app/constants/color.dart';

// ignore: must_be_immutable
class AppTextForm extends StatelessWidget {
  final String label;
  Color? labelColor;
  TextEditingController controller;
  AutovalidateMode? autovalidateMode;
  Color? cursorColor;
  TextInputType? keyboardType;
  bool obscureText;
  void Function(String)? onChanged;
  TextInputAction? textInputAction;
  String? Function(String?)? validator;
  Color? fillColor;
  Widget? suffixIcon;

  AppTextForm({
    super.key,
    required this.label,
    required this.controller,
    this.autovalidateMode,
    this.cursorColor = AppColors.primary,
    this.keyboardType = TextInputType.none,
    this.obscureText = false,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.labelColor = AppColors.white,
    this.fillColor = AppColors.blackTextField,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: autovalidateMode,
            controller: controller,
            cursorColor: cursorColor,
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            textInputAction: textInputAction,
            validator: validator,
            style: TextStyle(
              color: labelColor,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.greyLine,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
              hintText: label,
              hintStyle: const TextStyle(
                color: AppColors.greyLine,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              focusColor: labelColor,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
