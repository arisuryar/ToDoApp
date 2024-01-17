import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

class HomeCard extends StatelessWidget {
  final String tittle;
  final String category;
  final String description;
  Widget? leadingTittle;
  String? subCardLeft;
  Color? colorSubCardLeft;
  IconData? icon;
  bool withIcon;
  String? subCardRight;
  Color? colorSubCardRight;

  HomeCard({
    super.key,
    required this.tittle,
    required this.category,
    required this.description,
    this.leadingTittle,
    this.subCardLeft,
    this.subCardRight,
    this.colorSubCardLeft = AppColors.greyLine,
    this.colorSubCardRight = AppColors.greyLine,
    this.withIcon = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.blackTextField,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 35,
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    leadingTittle ?? SizedBox(),
                    const SizedBox(width: 15),
                    AppText(
                      text: tittle,
                      color: AppColors.white,
                      textSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary,
                  ),
                  child: AppText(
                    text: category,
                    color: AppColors.white,
                    textSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                        color: AppColors.greyLine, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            height: 0.3,
            color: AppColors.greyLine,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                withIcon == true
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            color: colorSubCardLeft,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          AppText(
                            text: subCardLeft ?? '',
                            fontWeight: FontWeight.w400,
                            color: colorSubCardLeft,
                            textSize: 12.0,
                          ),
                        ],
                      )
                    : AppText(
                        text: subCardLeft ?? '',
                        fontWeight: FontWeight.w400,
                        color: colorSubCardLeft,
                        textSize: 12.0,
                      ),
                AppText(
                  text: subCardRight ?? '',
                  fontWeight: FontWeight.w400,
                  color: colorSubCardRight,
                  textSize: 12.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
