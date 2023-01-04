import 'package:get/get.dart';
import 'package:teicommerce/app/models/products/category.dart';

class ProductController extends GetxController {
  var categories = <Category>[].obs;
  // var selectedCategoryIndex = 0.obs;
  late Category selectedCategory;

  @override
  void onInit() {
    super.onInit();
    categories.value = List.generate(10, (index) {
      return Category(id: index + 1, title: "Category ${index + 1}");
    });
    selectedCategory = categories[0];
  }

  // changeCategory(int index) {
  //   selectedCategoryIndex.value = index;
  //   update();
  // }

}
