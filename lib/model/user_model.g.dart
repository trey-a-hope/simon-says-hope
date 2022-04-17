// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      deviceID: json['deviceID'] as String,
      fcmToken: json['fcmToken'] as String?,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'deviceID': instance.deviceID,
      'fcmToken': instance.fcmToken,
      'username': instance.username,
    };
