import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';

import '../controllers/auth_controller.dart';

class AuthView extends StatelessWidget {
  AuthView({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.size.height * 0.55,
            child: Stack(
              children: [
                Container(
                  height: (Get.size.height * 0.55) - 60,
                  decoration: BoxDecoration(
                    color: AppColors.colorPaletteB,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: (Get.size.width * 0.5) - 60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.colorPaletteA,
                    child: const Icon(
                      Icons.adb_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Teicommerce",
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorPaletteB,
                ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "A platform build for a new way of shopping",
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: AppColors.colorPaletteB,
                ),
          ),
          Expanded(
            child: Center(
              child: SpinKitFoldingCube(
                color: AppColors.colorPaletteB,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
