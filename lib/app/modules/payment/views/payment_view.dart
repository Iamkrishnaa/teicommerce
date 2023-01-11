import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:teicommerce/app/modules/payment/bindings/payment_binding.dart';
import 'package:teicommerce/app/modules/payment/views/payment_confirm_view.dart';

import '../../../consts/app_colors.dart';
import '../../../widgets/buttons/custom_rounded_button.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'payment'.toUpperCase(),
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.size.height * 0.1,
                    ),
                    CustomRoundedButton(
                      color: Colors.pink.shade200,
                      radius: 8.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 12.0,
                        ),
                        child: Text(
                          "Klarna.",
                          style: GoogleFonts.oleoScript().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.2,
                    ),
                    const CustomTableRow(
                      title: "subtotal:",
                      value: "\$ 198.00",
                    ),
                    const CustomTableRow(
                      title: "shipment service:",
                      value: "\$ 02.45",
                    ),
                    CustomTableRow(
                      title: "discount:",
                      value: "-\$ 12.45",
                      valueStyle:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.colorPaletteA,
                              ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.blueGrey.shade100,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    CustomTableRow(
                      title: "total payment:",
                      value: "\$ 188.00",
                      valueStyle:
                          Theme.of(context).textTheme.headline5?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 24.0,
            ),
            color: Colors.white,
            child: Column(
              children: [
                CustomRoundedButton(
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
                        "pay now".toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  onTap: () {
                    final config = PaymentConfig(
                      amount: 10000, // Amount should be in paisa
                      productIdentity: 'dell-g5-g5510-2021',
                      productName: 'Dell G5 G5510 2021',
                      productUrl: 'https://www.khalti.com/#/bazaar',
                      additionalData: {
                        // Not mandatory; can be used for reporting purpose
                        'vendor': 'Khalti Bazaar',
                      },
                      mobile:
                          '9800000001', // Not mandatory; can be used to fill mobile number field
                      mobileReadOnly:
                          false, // Not mandatory; makes the mobile field not editable
                    );

                    KhaltiScope.of(context).pay(
                      config: config,
                      preferences: PaymentPreference.values,
                      onSuccess: (PaymentSuccessModel model) {
                        log("Payment Success");
                      },
                      onFailure: (PaymentFailureModel model) {
                        log("Failed");
                      },
                      onCancel: () {
                        log("Client Cancelled");
                      },
                    );
                    // Get.to(
                    //   () => PaymentConfirmView(),
                    //   binding: PaymentBinding(),
                    // );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTableRow extends StatelessWidget {
  const CustomTableRow({
    Key? key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  }) : super(key: key);
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toUpperCase(),
            style: titleStyle ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
          Text(
            value.toUpperCase(),
            style: valueStyle ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
        ],
      ),
    );
  }
}
