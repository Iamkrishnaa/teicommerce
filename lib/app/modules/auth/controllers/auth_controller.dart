import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    handleAuth();
  }

  handleAuth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    if (token != null) {
      Get.offAllNamed("home");
    } else {
      Get.offAllNamed("login");
    }
  }

  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token"); // remove specific key
    // sharedPreferences.clear(); //remove all keys
    Get.offAllNamed("login");
  }
}
