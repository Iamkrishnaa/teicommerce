import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:teicommerce/app/models/products/category.dart';
import 'package:http/http.dart' as http;
import 'package:teicommerce/app/models/products/product.dart';
import 'package:teicommerce/app/services/product_api_service.dart';

class ProductController extends GetxController {
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  // var selectedCategoryIndex = 0.obs;
  Category? selectedCategory;

  int categoryPage = 0;
  int categoryPageSize = 10;

  int productPage = 0;
  int productPageSize = 10;

  var isLoading = false.obs;

  @override
  void onInit() {
    getAllProducts();
    getAllCategories();
    super.onInit();
  }

  // changeCategory(int index) {
  //   selectedCategoryIndex.value = index;
  //   update();
  // }

  getAllCategories() async {
    try {
      http.Response response = await ProductApiService().getAllCategories(
        categoryPage,
        categoryPageSize,
        "id",
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var decodedJson = jsonDecode(response.body);
        var categoriesJson = jsonEncode(decodedJson["data"]);
        categories.value = Category.categoryFromJson(categoriesJson);
        update();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        var decodedResponse = jsonDecode(response.body);
        Get.showSnackbar(GetSnackBar(
          title: "Warning",
          message: decodedResponse["message"],
          duration: const Duration(seconds: 2),
        ));
      } else {
        throw Exception();
      }
    } catch (e) {}
  }

  getAllProducts() async {
    isLoading.value = true;
    try {
      http.Response response = await ProductApiService().getAllProducts(
        categoryPage,
        categoryPageSize,
        "id",
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var decodedJson = jsonDecode(response.body);
        var productsJson = jsonEncode(decodedJson["data"]);
        products.value = Product.productFromJson(productsJson);
        update();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        var decodedResponse = jsonDecode(response.body);
        Get.showSnackbar(GetSnackBar(
          title: "Warning",
          message: decodedResponse["message"],
          duration: const Duration(seconds: 2),
        ));
      } else {
        throw Exception();
      }
    } catch (e) {}
    isLoading.value = false;
  }

  getProductsByCategories() async {
    isLoading.value = true;
    if (selectedCategory == null) {
      return;
    }
    try {
      http.Response response = await ProductApiService().getProductsByCategory(
        categoryPage,
        categoryPageSize,
        "id",
        selectedCategory!.slug,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var decodedJson = jsonDecode(response.body);
        var productsJson = jsonEncode(decodedJson["data"]);
        products.value = Product.productFromJson(productsJson);
        update();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        var decodedResponse = jsonDecode(response.body);
        Get.showSnackbar(GetSnackBar(
          title: "Warning",
          message: decodedResponse["message"],
          duration: const Duration(seconds: 2),
        ));
      } else {
        throw Exception();
      }
    } catch (e) {}
    isLoading.value = false;
  }

  bool isCategorySelected(Category category) {
    if (selectedCategory != null) {
      return category.slug == selectedCategory!.slug;
    }
    return false;
  }

  isProductNew(Product product) {
    DateTime today = DateTime.now();
    int diff = today.difference(product.createdAt).inDays;
    if (diff < 2) {
      return true;
    }
    return false;
  }
}
