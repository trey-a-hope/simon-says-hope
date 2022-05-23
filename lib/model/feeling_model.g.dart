// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeling_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeelingModel _$$_FeelingModelFromJson(Map<String, dynamic> json) =>
    _$_FeelingModel(
      uid: json['uid'] as String,
      id: json['id'] as String?,
      heart: json['heart'] as String,
      mind: json['mind'] as String,
      soul: json['soul'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$_FeelingModelToJson(_$_FeelingModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'heart': instance.heart,
      'mind': instance.mind,
      'soul': instance.soul,
      'created': instance.created.toIso8601String(),
    };
