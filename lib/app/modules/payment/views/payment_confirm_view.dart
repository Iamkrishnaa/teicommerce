import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/app_colors.dart';
import '../../../widgets/buttons/custom_rounded_button.dart';

class PaymentConfirmView extends GetView {
  const PaymentConfirmView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction'.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: AppColors.colorPaletteA,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey.shade50,
                            radius: 50,
                            child: Icon(
                              Icons.check_rounded,
                              color: AppColors.colorPaletteA,
                              size: 70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.08,
                      ),
                      Text(
                        "payment success".toUpperCase(),
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorPaletteB,
                                ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Your item will arrive at your address according to the delivery date",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Theme.of(context).textTheme.caption?.color,
                              fontFamily: GoogleFonts.viga().fontFamily,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 24.0,
            ),
            child: CustomRoundedButton(
              radius: 8.0,
              width: double.infinity,
              color: AppColors.colorPaletteB,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: Center(
                  child: Text(
                    "back to shop".toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              onTap: () {
                Get.offAllNamed(
                  "home",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
