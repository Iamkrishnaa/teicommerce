import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';
import 'package:teicommerce/app/widgets/buttons/custom_rounded_button.dart';

class ProductDetailView extends GetView {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.size.height * 0.5,
                    color: Colors.grey,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Center(
                            child: Text("Hll"),
                          ),
                          decoration: BoxDecoration(
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: CustomRoundedButton(
              radius: 8.0,
              color: AppColors.colorPaletteB,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Add to shopping bag",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
