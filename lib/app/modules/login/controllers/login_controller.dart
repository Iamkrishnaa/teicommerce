import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teicommerce/app/models/login/login_request.dart';
import 'package:teicommerce/app/models/login/login_response.dart';
import 'package:teicommerce/app/services/auth_api_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      LoginRequest loginRequest = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      http.Response response = await AuthApiService().loginUser(loginRequest);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        LoginResponse loginResponse =
            LoginResponse.loginResponseFromJson(response.body);

        await storeLoginTokens(loginResponse);

        Get.offAllNamed("home");
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

  storeLoginTokens(LoginResponse loginResponse) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(
      "token",
      loginResponse.token,
    );

    preferences.setString(
      "refreshToken",
      loginResponse.refreshToken,
    );
  }
}
