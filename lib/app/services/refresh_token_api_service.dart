import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teicommerce/app/consts/app_apis.dart';

import 'interceptors/jwt_interceptor.dart';
import 'interceptors/refresh_token_retry_policy.dart';

class RefreshTokenApiService {
  static get client => InterceptedClient.build(
        interceptors: [
          RefreshTokenInterceptor(),
        ],
        retryPolicy: RefreshTokenRetryPolicy(),
      );

  Future<void> refreshToken() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      var url = Uri.parse(AppApis.authApis.getRefreshToken);
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String body = response.body;

        var dataFromApi = jsonDecode(body);

        String accessToken = dataFromApi["token"];
        await preferences.setString(
          "token",
          accessToken,
        );
      } else {
        String body = response.body;
        var dataFromApi = jsonDecode(body);
        throw Exception(dataFromApi["message"]);
      }
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }
}
