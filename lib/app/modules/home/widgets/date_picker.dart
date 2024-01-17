import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: 'Deadline Date', color: AppColors.white, textSize: 16),
        const SizedBox(height: 10),
        Obx(() => OutlinedButton(
              onPressed: () async {
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: controller.initialDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                controller.selectDate(dateTime!);
              },
              style: OutlinedButton.styleFrom(
                fixedSize: Size(Get.width, 56),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.greyLine, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                side: const BorderSide(color: AppColors.greyLine, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: controller.selectedDate.value == ''
                        ? 'Choose Date'
                        : controller.selectedDate.value,
                    color: AppColors.greyLine,
                    textSize: 16,
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.primary,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
