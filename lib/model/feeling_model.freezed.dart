// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feeling_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeelingModel _$FeelingModelFromJson(Map<String, dynamic> json) {
  return _FeelingModel.fromJson(json);
}

/// @nodoc
class _$FeelingModelTearOff {
  const _$FeelingModelTearOff();

  _FeelingModel call(
      {required String uid,
      String? id,
      required String heartFeeling,
      required String mindFeeling,
      required String soulFeeling}) {
    return _FeelingModel(
      uid: uid,
      id: id,
      heartFeeling: heartFeeling,
      mindFeeling: mindFeeling,
      soulFeeling: soulFeeling,
    );
  }

  FeelingModel fromJson(Map<String, Object?> json) {
    return FeelingModel.fromJson(json);
  }
}

/// @nodoc
const $FeelingModel = _$FeelingModelTearOff();

/// @nodoc
mixin _$FeelingModel {
  /// Unique id of the user.
  String get uid => throw _privateConstructorUsedError;

  /// ID of the feeling.
  String? get id => throw _privateConstructorUsedError;

  /// How does your heart feel?
  String get heartFeeling => throw _privateConstructorUsedError;

  /// How does your mind feel?
  String get mindFeeling => throw _privateConstructorUsedError;

  /// How does your soul feel?
  String get soulFeeling => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeelingModelCopyWith<FeelingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeelingModelCopyWith<$Res> {
  factory $FeelingModelCopyWith(
          FeelingModel value, $Res Function(FeelingModel) then) =
      _$FeelingModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String? id,
      String heartFeeling,
      String mindFeeling,
      String soulFeeling});
}

/// @nodoc
class _$FeelingModelCopyWithImpl<$Res> implements $FeelingModelCopyWith<$Res> {
  _$FeelingModelCopyWithImpl(this._value, this._then);

  final FeelingModel _value;
  // ignore: unused_field
  final $Res Function(FeelingModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
    Object? heartFeeling = freezed,
    Object? mindFeeling = freezed,
    Object? soulFeeling = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      heartFeeling: heartFeeling == freezed
          ? _value.heartFeeling
          : heartFeeling // ignore: cast_nullable_to_non_nullable
              as String,
      mindFeeling: mindFeeling == freezed
          ? _value.mindFeeling
          : mindFeeling // ignore: cast_nullable_to_non_nullable
              as String,
      soulFeeling: soulFeeling == freezed
          ? _value.soulFeeling
          : soulFeeling // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FeelingModelCopyWith<$Res>
    implements $FeelingModelCopyWith<$Res> {
  factory _$FeelingModelCopyWith(
          _FeelingModel value, $Res Function(_FeelingModel) then) =
      __$FeelingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String? id,
      String heartFeeling,
      String mindFeeling,
      String soulFeeling});
}

/// @nodoc
class __$FeelingModelCopyWithImpl<$Res> extends _$FeelingModelCopyWithImpl<$Res>
    implements _$FeelingModelCopyWith<$Res> {
  __$FeelingModelCopyWithImpl(
      _FeelingModel _value, $Res Function(_FeelingModel) _then)
      : super(_value, (v) => _then(v as _FeelingModel));

  @override
  _FeelingModel get _value => super._value as _FeelingModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
    Object? heartFeeling = freezed,
    Object? mindFeeling = freezed,
    Object? soulFeeling = freezed,
  }) {
    return _then(_FeelingModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      heartFeeling: heartFeeling == freezed
          ? _value.heartFeeling
          : heartFeeling // ignore: cast_nullable_to_non_nullable
              as String,
      mindFeeling: mindFeeling == freezed
          ? _value.mindFeeling
          : mindFeeling // ignore: cast_nullable_to_non_nullable
              as String,
      soulFeeling: soulFeeling == freezed
          ? _value.soulFeeling
          : soulFeeling // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeelingModel with DiagnosticableTreeMixin implements _FeelingModel {
  _$_FeelingModel(
      {required this.uid,
      this.id,
      required this.heartFeeling,
      required this.mindFeeling,
      required this.soulFeeling});

  factory _$_FeelingModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeelingModelFromJson(json);

  @override

  /// Unique id of the user.
  final String uid;
  @override

  /// ID of the feeling.
  final String? id;
  @override

  /// How does your heart feel?
  final String heartFeeling;
  @override

  /// How does your mind feel?
  final String mindFeeling;
  @override

  /// How does your soul feel?
  final String soulFeeling;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeelingModel(uid: $uid, id: $id, heartFeeling: $heartFeeling, mindFeeling: $mindFeeling, soulFeeling: $soulFeeling)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeelingModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('heartFeeling', heartFeeling))
      ..add(DiagnosticsProperty('mindFeeling', mindFeeling))
      ..add(DiagnosticsProperty('soulFeeling', soulFeeling));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeelingModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.heartFeeling, heartFeeling) ||
                other.heartFeeling == heartFeeling) &&
            (identical(other.mindFeeling, mindFeeling) ||
                other.mindFeeling == mindFeeling) &&
            (identical(other.soulFeeling, soulFeeling) ||
                other.soulFeeling == soulFeeling));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, id, heartFeeling, mindFeeling, soulFeeling);

  @JsonKey(ignore: true)
  @override
  _$FeelingModelCopyWith<_FeelingModel> get copyWith =>
      __$FeelingModelCopyWithImpl<_FeelingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeelingModelToJson(this);
  }
}

abstract class _FeelingModel implements FeelingModel {
  factory _FeelingModel(
      {required String uid,
      String? id,
      required String heartFeeling,
      required String mindFeeling,
      required String soulFeeling}) = _$_FeelingModel;

  factory _FeelingModel.fromJson(Map<String, dynamic> json) =
      _$_FeelingModel.fromJson;

  @override

  /// Unique id of the user.
  String get uid;
  @override

  /// ID of the feeling.
  String? get id;
  @override

  /// How does your heart feel?
  String get heartFeeling;
  @override

  /// How does your mind feel?
  String get mindFeeling;
  @override

  /// How does your soul feel?
  String get soulFeeling;
  @override
  @JsonKey(ignore: true)
  _$FeelingModelCopyWith<_FeelingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
