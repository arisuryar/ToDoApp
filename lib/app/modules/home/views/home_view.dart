import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/app/constants/assets.dart';
import 'package:to_do_app/app/modules/home/components/home_bottomsheet.dart';
import 'package:to_do_app/app/modules/home/components/home_card.dart';
import 'package:to_do_app/app/modules/home/components/home_tittle.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeTittle,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            HomeCard(
              tittle: 'Tap plus to create a new task',
              subCardLeft: 'Add your task',
              subCardRight:
                  DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
              leadingTittle: GestureDetector(
                child: SvgPicture.asset(AssetsString.iconAdd),
                onTap: () {
                  homeBottomSheet(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            HomeCard(
              tittle: 'Ngopi Warkop Udin',
              subCardLeft: '21:00 PM',
              subCardRight:
                  DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
              withIcon: true,
              icon: Icons.alarm,
              colorSubCardLeft: Colors.red,
              leadingTittle: GestureDetector(
                child: SvgPicture.asset(AssetsString.iconTask),
                onTap: () {
                  homeBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
