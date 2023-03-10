import 'package:get/get.dart';
import 'package:teicommerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:teicommerce/app/modules/messages/controllers/messages_controller.dart';
import 'package:teicommerce/app/modules/orders/controllers/orders_controller.dart';
import 'package:teicommerce/app/modules/product/controllers/product_controller.dart';
import 'package:teicommerce/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
    Get.lazyPut<OrdersController>(
      () => OrdersController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
