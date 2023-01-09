import 'dart:convert';

class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.fullName,
    required this.userName,
    required this.phoneNumber,
    required this.password,
  });

  final String email;
  final String fullName;
  final String userName;
  final String phoneNumber;
  final String password;

  static RegisterRequest registerRequestFromJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  static String registerRequestToJson(RegisterRequest data) =>
      json.encode(data.toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json["email"],
        fullName: json["fullName"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullName": fullName,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "password": password,
      };
}
