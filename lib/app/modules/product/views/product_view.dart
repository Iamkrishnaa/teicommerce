import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teicommerce/app/consts/app_colors.dart';
import 'package:teicommerce/app/models/products/category.dart';
import 'package:teicommerce/app/modules/product/views/product_detail_view.dart';
import 'package:teicommerce/app/widgets/buttons/custom_rounded_button.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 30.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Brace Yourself!\nGet Yours!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            CustomRoundedButton(
                              width: 150,
                              color: AppColors.colorPaletteA,
                              radius: 10.0,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  child: Text(
                                    "Shop Now",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 16.0,
                      ),
                      child: Image(
                        image: AssetImage(
                          "assets/logo1.png",
                        ),
                        width: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   physics: const BouncingScrollPhysics(),
              //   child: Obx(
              //     () => Row(
              //       children: List.generate(
              //         productController.categories.length,
              //         (index) => Padding(
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: 12.0,
              //             vertical: 8.0,
              //           ),
              //           child: CustomRoundedButton(
              //             radius: 8.0,
              //             color: AppColors.colorPaletteB,
              //             shouldFill: index ==
              //                 productController.selectedCategoryIndex.value,
              //             child: Padding(
              //               padding: const EdgeInsets.symmetric(
              //                 vertical: 16.0,
              //                 horizontal: 16.0,
              //               ),
              //               child: Text(
              //                 productController.categories[index].title,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .titleMedium
              //                     ?.copyWith(
              //                       fontWeight: FontWeight.w600,
              //                       color: index ==
              //                               productController
              //                                   .selectedCategoryIndex.value
              //                           ? Colors.white
              //                           : AppColors.colorPaletteB,
              //                     ),
              //               ),
              //             ),
              //             onTap: () {
              //               productController.changeCategory(index);
              //             },
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: GetBuilder<ProductController>(
                    init: productController,
                    builder: (productController) {
                      return Row(
                        children: productController.categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            child: CustomRoundedButton(
                              radius: 8.0,
                              color: AppColors.colorPaletteB,
                              shouldFill: category.id ==
                                  productController.selectedCategory.id,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  category.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: category.id ==
                                                productController
                                                    .selectedCategory.id
                                            ? Colors.white
                                            : AppColors.colorPaletteB,
                                      ),
                                ),
                              ),
                              onTap: () {
                                productController.selectedCategory = category;
                                productController.update();
                              },
                            ),
                          );
                        }).toList(),
                      );
                    }),
              ),
              GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: List.generate(
                  20,
                  (index) => GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetailView(),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRoundedButton(
                            width: 50,
                            color: AppColors.colorPaletteA,
                            radius: 10.0,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  "New",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            "\$ 198.00",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Text(
                            "Romantic Book askdf askdf",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
