import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';
import 'package:teicommerce/app/widgets/buttons/custom_rounded_button.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView {
  ProductDetailView({Key? key}) : super(key: key);
  final ProductDetailController productDetailController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 247, 248),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProductImageSlider(),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$198.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "Cotton-Terry Hoodie With exclusive atrwork"
                                  .toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: GetBuilder<ProductDetailController>(
                                  init: productDetailController,
                                  builder: (productController) {
                                    return Row(
                                      children: productController.categories
                                          .map((category) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 12.0,
                                            top: 12.0,
                                            bottom: 12.0,
                                          ),
                                          child: CustomRoundedButton(
                                            radius: 8.0,
                                            color: AppColors.colorPaletteA,
                                            shouldFill: category.id ==
                                                productController
                                                    .selectedCategory.id,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 16.0,
                                              ),
                                              child: Text(
                                                category.title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: category.id ==
                                                              productController
                                                                  .selectedCategory
                                                                  .id
                                                          ? Colors.white
                                                          : AppColors
                                                              .colorPaletteB,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  }),
                            ),
                            Theme(
                              data: ThemeData().copyWith(
                                expansionTileTheme:
                                    const ExpansionTileThemeData().copyWith(
                                  iconColor: AppColors.colorPaletteA,
                                ),
                                dividerColor: Colors.transparent,
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  "Detail",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                tilePadding: EdgeInsets.zero,
                                children: [
                                  Text(
                                    "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do eiusmod tempor \nincididunt ut labore et dolore \nmagna aliqua. Ut enim ad minim veniam, quis nostrud exercitation \nullamco laboris nisi ut aliquip ex ea commodo consequat.\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.white,
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
              onTap: () {
                Get.toNamed("cart");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.5,
      color: Colors.grey,
      child: PageView.builder(
        itemBuilder: (context, index) {
          return Container(
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
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                          child: Row(
                            children: [
                              CustomRoundedButton(
                                color: AppColors.colorPaletteA.withOpacity(0.8),
                                radius: 6.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    "Klarna.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                "free payment of \$49.50.",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Learn More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
