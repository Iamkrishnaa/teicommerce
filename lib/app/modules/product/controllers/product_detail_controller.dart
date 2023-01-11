import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/products/category.dart';

class ProductDetailController extends GetxController {
  var categories = <Category>[].obs;
  late Category selectedCategory;
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }
}
