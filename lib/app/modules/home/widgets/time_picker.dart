import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/constants/color.dart';
import 'package:to_do_app/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_app/app/widgets/app_text.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: 'Deadline Time', color: AppColors.white, textSize: 16),
        const SizedBox(height: 10),
        Obx(() => OutlinedButton(
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: controller.initialTime!,
                    initialEntryMode: TimePickerEntryMode.inputOnly);
                controller.selectTime(timeOfDay!);
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
                    text: controller.selectedTime.value == ''
                        ? 'Choose Time'
                        : controller.selectedTime.value,
                    color: AppColors.greyLine,
                    textSize: 16,
                  ),
                  const Icon(
                    Icons.alarm,
                    color: AppColors.primary,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
