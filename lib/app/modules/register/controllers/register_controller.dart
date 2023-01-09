import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:teicommerce/app/models/register/register_request.dart';

import '../../../services/auth_api_service.dart';

class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  registerUser() async {
    try {
      RegisterRequest registerRequest = RegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        fullName: fullNameController.text,
        userName: userNameController.text,
        phoneNumber: phoneController.text,
      );
      http.Response response =
          await AuthApiService().registerUser(registerRequest);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.showSnackbar(const GetSnackBar(
          title: "Success",
          message: "Register Success, You can now login.",
          duration: Duration(seconds: 2),
        ));

        Get.offAllNamed("login");
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
}
