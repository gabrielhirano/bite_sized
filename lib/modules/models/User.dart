

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
    required this.userName,
    required this.subscribers,
  });

  final String userName;
  late String profileImageUrl =
      'https://avatars.dicebear.com/api/bottts/$userName.png';
  final String subscribers;



  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json['userName'],
    subscribers: json['subscribers']
  );

  toJson() {
    return {
      'userName': userName,
      'subscribers': subscribers,
    };
  }
}
