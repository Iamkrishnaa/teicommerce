import 'package:get/get.dart';

import 'package:teicommerce/app/modules/product/controllers/product_detail_controller.dart';

import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
  }
}
