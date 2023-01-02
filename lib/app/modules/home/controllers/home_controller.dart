import 'package:get/get.dart';
import 'package:teicommerce/app/modules/home/views/home_view.dart';
import 'package:teicommerce/app/modules/messages/views/messages_view.dart';
import 'package:teicommerce/app/modules/orders/views/orders_view.dart';
import 'package:teicommerce/app/modules/product/views/product_view.dart';
import 'package:teicommerce/app/modules/profile/views/profile_view.dart';

class HomeController extends GetxController {
  var currentBottomNavigationIndex = 0.obs;

  getCurrentPage(int index) {
    switch (index) {
      case 0:
        return ProductView();
      case 1:
        return MessagesView();
      case 2:
        return OrdersView();
      case 3:
        return ProfileView();
      default:
        return ProductView();
    }
  }
}
