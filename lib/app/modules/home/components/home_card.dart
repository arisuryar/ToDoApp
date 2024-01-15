import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

class HomeCard extends StatelessWidget {
  final String tittle;
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
              children: [
                leadingTittle ?? SizedBox(),
                const SizedBox(width: 15),
                AppText(
                  text: tittle,
                  color: AppColors.white,
                  textSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
