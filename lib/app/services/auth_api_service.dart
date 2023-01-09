import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:teicommerce/app/consts/app_apis.dart';
import 'package:teicommerce/app/models/login/login_request.dart';

import '../models/register/register_request.dart';

class AuthApiService {
  var client = http.Client();

  Future loginUser(LoginRequest loginRequest) async {
    try {
      Uri url = Uri.parse(AppApis.authApis.getLogin);
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: LoginRequest.loginRequestToJson(loginRequest),
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future registerUser(RegisterRequest registerRequest) async {
    try {
      Uri url = Uri.parse(AppApis.authApis.getRegister);
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: RegisterRequest.registerRequestToJson(registerRequest),
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }
}
