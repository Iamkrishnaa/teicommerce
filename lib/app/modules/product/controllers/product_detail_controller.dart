import 'package:get/get.dart';

import '../../../models/products/category.dart';

class ProductDetailController extends GetxController {
  var categories = <Category>[].obs;
  late Category selectedCategory;

  @override
  void onInit() {
    super.onInit();

    selectedCategory = categories[0];
  }
}
