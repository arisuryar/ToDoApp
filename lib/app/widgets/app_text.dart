import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String text;
  Color? color;
  double? textSize;
  FontWeight? fontWeight;

  AppText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: color, fontWeight: fontWeight, fontSize: textSize),
      ),
    );
  }
}
