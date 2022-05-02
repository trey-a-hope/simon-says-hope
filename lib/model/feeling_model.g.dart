// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeling_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeelingModel _$$_FeelingModelFromJson(Map<String, dynamic> json) =>
    _$_FeelingModel(
      uid: json['uid'] as String,
      id: json['id'] as String?,
      heartFeeling: json['heartFeeling'] as String,
      mindFeeling: json['mindFeeling'] as String,
      soulFeeling: json['soulFeeling'] as String,
    );

Map<String, dynamic> _$$_FeelingModelToJson(_$_FeelingModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'heartFeeling': instance.heartFeeling,
      'mindFeeling': instance.mindFeeling,
      'soulFeeling': instance.soulFeeling,
    };
