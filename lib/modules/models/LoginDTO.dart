

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
    required this.email,
    required this.password,
  });

  late String? email;
  late String? password;



  factory Login.fromJson(Map<String, dynamic> json) => Login(
    email: json['email'],
    password: json['password']
  );

  toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
