String baseURL = "http://10.0.2.2:8080";

class AppApis {
  static AuthApis authApis = AuthApis();
  static ProductApis productApis = ProductApis();
  static CategoryApis categoryApis = CategoryApis();
}

class AuthApis {
  AuthApis();
  String get getLogin => "$baseURL/api/v1/auth/login";
  String get getRegister => "$baseURL/api/v1/auth/register";
  String get getRefreshToken => "$baseURL/api/v1/auth/refresh";
}

class ProductApis {
  ProductApis();
  String get getProductsByCategory => "$baseURL/api/v1/products/categories/";
  String get getAllProducts => "$baseURL/api/v1/products/all";
}

class CategoryApis {
  CategoryApis();
  String get getAllCategories => "$baseURL/api/v1/categories/all";
}
