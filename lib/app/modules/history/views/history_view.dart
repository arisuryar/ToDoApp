import 'package:ToDoApp/app/constants/assets.dart';
import 'package:ToDoApp/app/constants/color.dart';
import 'package:ToDoApp/app/data/models/task_model.dart';
import 'package:ToDoApp/app/modules/home/components/home_card.dart';
import 'package:ToDoApp/app/widgets/app_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackBackground,
        title: AppText(
            text: 'Task Done',
            color: AppColors.white,
            textSize: 24,
            fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
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
          return ListView(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      text: 'Total Task Completed : ',
                      color: AppColors.secondary,
                      textSize: 16,
                      fontWeight: FontWeight.w600),
                  AppText(
                      text: '${snapshot.data!.docs.length}',
                      color: AppColors.secondary,
                      textSize: 16,
                      fontWeight: FontWeight.w600),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        bannerColor: AppColors.secondary,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
