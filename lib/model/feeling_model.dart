import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'feeling_model.freezed.dart';
part 'feeling_model.g.dart';

@freezed
class FeelingModel with _$FeelingModel {
  factory FeelingModel({
    /// Unique id of the user.
    required String uid,

    /// ID of the feeling.
    String? id,

    /// How does your heart feel?
    required String heartFeeling,

    /// How does your mind feel?
    required String mindFeeling,

    /// How does your soul feel?
    required String soulFeeling,
  }) = _FeelingModel;

  factory FeelingModel.fromJson(Map<String, dynamic> json) =>
      _$FeelingModelFromJson(json);
}

//flutter pub run build_runner build --delete-conflicting-outputs