import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    /// Unique id of the user.
    required String uid,

    /// Firebase Cloud Message token for push notifications.
    String? fcmToken,

    /// Username of the user.
    required String username,

    /// Email of the user.
    required String email,

    /// User color.
    required String color,

    /// Image url.
    String? imgUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

//flutter pub run build_runner build --delete-conflicting-outputs
