import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/modules/home/controllers/home_controller.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        AppText(
          text: 'Deadline Time',
          color: AppColors.secondary,
          fontWeight: FontWeight.w700,
        ),
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
                  ),
                  const Icon(
                    Icons.alarm,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
