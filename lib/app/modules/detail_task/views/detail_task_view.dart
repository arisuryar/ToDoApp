import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/data/models/task_model.dart';
import 'package:ToDoApp/app/modules/detail_task/widgets/detail_textfield.dart';
import 'package:ToDoApp/app/widgets/app_button.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_task_controller.dart';

class DetailTaskView extends GetView<DetailTaskController> {
  const DetailTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackBackground,
        title: Obx(() => AppText(
              text: controller.isEdit.isTrue ? 'Edit Task' : 'Detail Task',
              textSize: 22,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: controller.getTask(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Task task = Task.fromJson(snapshot.data!.data()!);
          controller.tittleC.text = task.tittle!;
          controller.categoryC.text = task.category!;
          controller.descriptionC.text = task.description!;
          return Obx(
            () => controller.isEdit.isTrue
                ? ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    children: [
                      DetailTextField(
                          label: 'Tittle', controller: controller.tittleC),
                      const SizedBox(height: 20),
                      DetailTextField(
                          label: 'Category', controller: controller.categoryC),
                      const SizedBox(height: 20),
                      DetailTextField(
                          label: 'Description',
                          controller: controller.descriptionC,
                          textInputAction: TextInputAction.newline,
                          maxLines: 10),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Deadline Date',
                            color: AppColors.primary,
                            textSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 10),
                          Obx(() => OutlinedButton(
                                onPressed: () async {
                                  final DateTime? dateTime =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: DateFormat('EEEE, d MMMM yyyy')
                                        .parse(task.deadlineDate!),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2030),
                                  );
                                  if (dateTime != null) {
                                    controller.selectedDate.value =
                                        DateFormat('EEEE, d MMMM yyyy')
                                            .format(dateTime);
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  fixedSize: Size(Get.width, 56),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AppColors.greyLine, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: AppColors.greyLine, width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: controller.selectedDate.value == ''
                                          ? task.deadlineDate!
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
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Deadline Time',
                            color: AppColors.primary,
                            textSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 10),
                          Obx(() => OutlinedButton(
                                onPressed: () async {
                                  List<String> timeSplit =
                                      task.deadlineTime!.split(':');
                                  final TimeOfDay?
                                      timeOfDay = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay(
                                              hour: int.parse(timeSplit[0]),
                                              minute: int.parse(timeSplit[1])),
                                          initialEntryMode:
                                              TimePickerEntryMode.inputOnly);
                                  if (timeOfDay != null) {
                                    controller.selectedTime.value =
                                        '${timeOfDay.hour}:${timeOfDay.minute}';
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  fixedSize: Size(Get.width, 56),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AppColors.greyLine, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: AppColors.greyLine, width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: controller.selectedTime.value == ''
                                          ? task.deadlineTime!
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
                      ),
                      const SizedBox(height: 40),
                      AppButton(
                        label: 'Edit',
                        fixedSize: Size(Get.width, 56),
                        onPressed: () async {
                          controller.taskController.editTask(
                            Get.arguments,
                            controller.tittleC.text,
                            controller.descriptionC.text,
                            controller.categoryC.text,
                            controller.selectedDate.value == ''
                                ? task.deadlineDate!
                                : controller.selectedDate.value,
                            controller.selectedTime.value == ''
                                ? task.deadlineTime!
                                : controller.selectedTime.value,
                          );
                          Get.dialog(
                              const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.primary)),
                              barrierDismissible: false);
                          await Future.delayed(const Duration(seconds: 3));
                          Get.back();
                          Get.defaultDialog(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            backgroundColor: AppColors.blackTextField,
                            title: 'Berhasil',
                            titleStyle: GoogleFonts.poppins(
                                color: AppColors.secondary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            titlePadding: const EdgeInsets.only(top: 15),
                            middleText: 'Berhasil edit task',
                            middleTextStyle: GoogleFonts.poppins(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          );
                          await Future.delayed(const Duration(seconds: 3));
                          Get.back();
                          controller.isEdit.toggle();
                          Get.back();
                        },
                        color: AppColors.white,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                      text: task.tittle!,
                                      color: AppColors.white,
                                      textSize: 20,
                                      fontWeight: FontWeight.w600),
                                  const SizedBox(height: 10),
                                  AppText(
                                      text: task.description!,
                                      color: AppColors.greyLine,
                                      textSize: 16),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.timer_outlined,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      AppText(
                                          text: 'Task Time :',
                                          color: AppColors.white,
                                          textSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyTextField,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: AppText(
                                    text:
                                        '${task.deadlineDate} ${task.deadlineTime}',
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.category_outlined,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      AppText(
                                          text: 'Category :',
                                          color: AppColors.white,
                                          textSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyTextField,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: AppText(
                                    text: task.category!,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      AppText(
                                          text: 'Create At :',
                                          color: AppColors.white,
                                          textSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyTextField,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: AppText(
                                    text: task.createdAt!,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () => controller.taskController
                                  .deleteTask(Get.arguments),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    AppText(
                                        text: 'Delete Task',
                                        color: Colors.red,
                                        textSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () => controller.taskController
                                  .doneTask(Get.arguments),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle_rounded,
                                      color: AppColors.secondary,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    AppText(
                                        text: 'Done Task',
                                        color: AppColors.secondary,
                                        textSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppButton(
                          label: 'Edit Task',
                          color: AppColors.white,
                          fixedSize: Size(Get.width, 48),
                          onPressed: () => controller.isEdit.toggle(),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
