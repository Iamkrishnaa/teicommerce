import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';
import 'package:teicommerce/app/widgets/buttons/custom_rounded_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.colorPaletteB,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomRoundedButton(
            onTap: () {},
            color: Colors.grey.shade400,
            radius: 10,
            shouldFill: false,
            child: const Icon(Icons.qr_code_2),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomRoundedButton(
              onTap: () {},
              color: Colors.grey.shade400,
              radius: 10,
              width: 40,
              height: 40,
              shouldFill: false,
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Column(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: homeController.currentBottomNavigationIndex.value,
          elevation: 0,
          selectedItemColor: AppColors.colorPaletteB,
          onTap: (value) {
            homeController.currentBottomNavigationIndex.value = value;
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: false,
                child: const Icon(
                  FontAwesomeIcons.store,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: false,
                child: const Icon(FontAwesomeIcons.envelopeOpen),
              ),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: false,
                child: const Icon(FontAwesomeIcons.gift),
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: false,
                child: const Icon(FontAwesomeIcons.productHunt),
              ),
              label: "Favourites",
            ),
          ],
        ),
      ),
    );
  }
}
