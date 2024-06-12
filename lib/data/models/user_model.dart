import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String refreshToken;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'refreshToken': refreshToken,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      refreshToken: json['refreshToken'],
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      refreshToken: user.refreshToken ?? '',
    );
  }
}
