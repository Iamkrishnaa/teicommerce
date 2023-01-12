import 'package:get/get.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/views/login_view.dart';
import '../refresh_token_api_service.dart';

class RefreshTokenRetryPolicy extends RetryPolicy {
  @override
  int get maxRetryAttempts => 2;

  @override
  bool shouldAttemptRetryOnException(Exception reason) {
    return false;
  }

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401 || response.statusCode == 403) {
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String? refreshToken = preferences.getString("refreshToken");
        if (refreshToken == null) {
          return false;
        }
        await RefreshTokenApiService().refreshToken();
      } catch (e) {
        Get.to(
          () => LoginView(),
          binding: LoginBinding(),
        );
        return false;
      }
      return true;
    }
    return false;
  }
}
