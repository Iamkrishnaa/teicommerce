import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.refreshToken,
    required this.tokenType,
  });

  final String token;
  final String refreshToken;
  final String tokenType;

  static LoginResponse loginResponseFromJson(String str) =>
      LoginResponse.fromJson(
        json.decode(str),
      );

  static String loginResponseToJson(LoginResponse data) => json.encode(
        data.toJson(),
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        refreshToken: json["refreshToken"],
        tokenType: json["tokenType"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "tokenType": tokenType,
      };
}
