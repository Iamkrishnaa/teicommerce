import 'package:get/get.dart';

import '../../../models/products/category.dart';

class ProductDetailController extends GetxController {
  var categories = <Category>[].obs;
  late Category selectedCategory;

  @override
  void onInit() {
    super.onInit();
    categories.value = List.generate(10, (index) {
      return Category(id: index + 1, title: "Cat ${index + 1}");
    });
    selectedCategory = categories[0];
  }
}
