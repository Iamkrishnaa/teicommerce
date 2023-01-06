import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';

import '../../../widgets/buttons/custom_rounded_button.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'shipment'.toUpperCase(),
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
                horizontal: 16.0,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipment location".toUpperCase(),
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              builder: (context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        12.0,
                                      ),
                                      topRight: Radius.circular(
                                        12.0,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: Get.size.width * 0.2,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(
                                              100.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const ListTile(
                                        title: Text("Address 1"),
                                        subtitle: Text("Address Detail"),
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.location_city,
                                            color: Colors.grey,
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
                                              vertical: 12.0,
                                              horizontal: 8.0,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Select".toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "change location".toUpperCase(),
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      color: AppColors.colorPaletteA,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Studio".toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Bagar-1, Pokhara Gandaki",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.blueGrey.shade50,
                    ),
                    CustomRoundedButton(
                      color: Colors.grey.shade200,
                      radius: 12.0,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delivery_dining_rounded,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Text(
                                "shipment".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                              ),
                            ),
                            const Icon(
                              Icons.apple,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    CustomRoundedButton(
                      color: Colors.grey.shade200,
                      radius: 12.0,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Text(
                                "payment".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                              ),
                            ),
                            const Icon(
                              Icons.deblur,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "products".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Column(
                      children: List.generate(
                        10,
                        (index) => CheckoutProductCard(),
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
                  color: Colors.grey.shade200,
                  radius: 12.0,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.token,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Text(
                            "use your promo code".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.blueGrey.shade50,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Payment:".toUpperCase(),
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$ 198.00".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.colorPaletteA,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomRoundedButton(
                      radius: 8.0,
                      color: AppColors.colorPaletteB,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          "Checkout".toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      onTap: () {
                        Get.toNamed("payment");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutProductCard extends StatelessWidget {
  const CheckoutProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.blueGrey.shade200,
              image: DecorationImage(
                image: const NetworkImage(
                  "https://images.unsplash.com/photo-1617469167379-2e33a480dd6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
                ),
                fit: BoxFit.cover,
                //make background darker
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$ 198.00",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Cotton-Terry Hoodie With exclusive atrwork".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    CustomRoundedButton(
                      color: AppColors.colorPaletteB,
                      shouldFill: true,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "1",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    CustomRoundedButton(
                      color: AppColors.colorPaletteB,
                      shouldFill: false,
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
