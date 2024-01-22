import 'package:ToDoApp/app/constants/assets.dart';
import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/data/models/task_model.dart';
import 'package:ToDoApp/app/modules/home/components/home_card.dart';
import 'package:ToDoApp/app/modules/home/components/home_header.dart';
import 'package:ToDoApp/app/modules/home/widgets/category.dart';
import 'package:ToDoApp/app/modules/home/widgets/date_picker.dart';
import 'package:ToDoApp/app/modules/home/widgets/description.dart';
import 'package:ToDoApp/app/modules/home/widgets/time_picker.dart';
import 'package:ToDoApp/app/modules/home/widgets/tittle.dart';
import 'package:ToDoApp/app/routes/app_pages.dart';
import 'package:ToDoApp/app/widgets/app_button.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeHeader,
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamTask,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: AppText(text: 'Terjadi Kesalahan', color: AppColors.white),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: AppText(
                  text: 'Belum ada task, silahkan tambahkan task',
                  color: AppColors.white),
            );
          }
          Future.delayed(const Duration(seconds: 2));
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data!.docs[index].data();
              Task task = Task.fromJson(data);

              return Column(
                children: [
                  HomeCard(
                    tittle: task.tittle!,
                    category: task.category!,
                    description: task.description!,
                    leadingTittle: SvgPicture.asset(AssetsString.iconTask),
                    subCardLeft: task.deadlineTime,
                    subCardRight: task.deadlineDate,
                    withIcon: true,
                    icon: Icons.alarm,
                    colorSubCardLeft: Colors.red,
                    colorSubCardRight: AppColors.greyLine,
                    onTap: () => Get.toNamed(Routes.DETAIL_TASK,
                        arguments: snapshot.data!.docs[index].id),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: context.mediaQueryViewInsets.bottom,
              ),
              child: Container(
                height: Get.height * 0.70,
                decoration: const BoxDecoration(
                  color: AppColors.blackTextField,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [
                    TittleWidget(controller: controller),
                    const SizedBox(height: 20),
                    CategoryWidget(controller: controller),
                    const SizedBox(height: 20),
                    DescriptionWidget(controller: controller),
                    const SizedBox(height: 20),
                    DatePicker(controller: controller),
                    const SizedBox(height: 20),
                    TimePicker(controller: controller),
                    const SizedBox(height: 50),
                    AppButton(
                        label: 'Add Task',
                        onPressed: () => controller.validationSubmit(),
                        fixedSize: Size(Get.width, 56),
                        color: AppColors.white,
                        backgroundColor: AppColors.primary),
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
