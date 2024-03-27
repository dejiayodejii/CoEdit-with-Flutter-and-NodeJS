// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class UserModel {
  UserModel({
    required this.message,
    required this.token,
    required this.user,
  });

  final String message;
  final String token;
  final User user;

  UserModel copyWith({
    String? message,
    String? token,
    User? user,
  }) =>
      UserModel(
        message: message ?? this.message,
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user.toJson(),
      };

  @override
  String toString() =>
      'UserModel(message: $message, token: $token, user: $user)';
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phone,
  });

  final String name;

  final String email;
  final String phone;

  User copyWith({
    String? name,
    String? email,
    String? phone,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phone,
      };

  @override
  String toString() {
    return 'User( name: $name, email: $email, phone: $phone,)';
  }
}
