import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';
import 'package:teicommerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:teicommerce/app/widgets/buttons/custom_rounded_button.dart';

import '../../../utils/helpers.dart';
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
            onTap: () async {
              Get.showOverlay(
                asyncFunction: () async {
                  await AuthController.logout();
                },
                loadingWidget: Helpers.getLoadingWidget(),
              );
            },
            color: Colors.grey.shade400,
            radius: 10,
            shouldFill: false,
            child: const Icon(Icons.logout_rounded),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Badge(
              badgeContent: Text(
                "0",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              child: CustomRoundedButton(
                onTap: () {
                  Get.toNamed("cart");
                },
                color: Colors.grey.shade400,
                radius: 10,
                width: 40,
                height: 40,
                shouldFill: false,
                child: const Icon(
                  Icons.shopping_bag,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => homeController.getCurrentPage(
          homeController.currentBottomNavigationIndex.value,
        ),
      ),
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
            const BottomNavigationBarItem(
              icon: CircleAvatar(),
              label: "Favourites",
            ),
          ],
        ),
      ),
    );
  }
}
