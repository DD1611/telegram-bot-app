// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PigeonUserDetails _$PigeonUserDetailsFromJson(Map<String, dynamic> json) {
  return _PigeonUserDetails.fromJson(json);
}

/// @nodoc
mixin _$PigeonUserDetails {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this PigeonUserDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PigeonUserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PigeonUserDetailsCopyWith<PigeonUserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PigeonUserDetailsCopyWith<$Res> {
  factory $PigeonUserDetailsCopyWith(
          PigeonUserDetails value, $Res Function(PigeonUserDetails) then) =
      _$PigeonUserDetailsCopyWithImpl<$Res, PigeonUserDetails>;
  @useResult
  $Res call({String id, String email, String displayName, String photoUrl});
}

/// @nodoc
class _$PigeonUserDetailsCopyWithImpl<$Res, $Val extends PigeonUserDetails>
    implements $PigeonUserDetailsCopyWith<$Res> {
  _$PigeonUserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PigeonUserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? photoUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PigeonUserDetailsImplCopyWith<$Res>
    implements $PigeonUserDetailsCopyWith<$Res> {
  factory _$$PigeonUserDetailsImplCopyWith(_$PigeonUserDetailsImpl value,
          $Res Function(_$PigeonUserDetailsImpl) then) =
      __$$PigeonUserDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String displayName, String photoUrl});
}

/// @nodoc
class __$$PigeonUserDetailsImplCopyWithImpl<$Res>
    extends _$PigeonUserDetailsCopyWithImpl<$Res, _$PigeonUserDetailsImpl>
    implements _$$PigeonUserDetailsImplCopyWith<$Res> {
  __$$PigeonUserDetailsImplCopyWithImpl(_$PigeonUserDetailsImpl _value,
      $Res Function(_$PigeonUserDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PigeonUserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? photoUrl = null,
  }) {
    return _then(_$PigeonUserDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PigeonUserDetailsImpl implements _PigeonUserDetails {
  const _$PigeonUserDetailsImpl(
      {required this.id,
      required this.email,
      this.displayName = '',
      this.photoUrl = ''});

  factory _$PigeonUserDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PigeonUserDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String photoUrl;

  @override
  String toString() {
    return 'PigeonUserDetails(id: $id, email: $email, displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PigeonUserDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, displayName, photoUrl);

  /// Create a copy of PigeonUserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PigeonUserDetailsImplCopyWith<_$PigeonUserDetailsImpl> get copyWith =>
      __$$PigeonUserDetailsImplCopyWithImpl<_$PigeonUserDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PigeonUserDetailsImplToJson(
      this,
    );
  }
}

abstract class _PigeonUserDetails implements PigeonUserDetails {
  const factory _PigeonUserDetails(
      {required final String id,
      required final String email,
      final String displayName,
      final String photoUrl}) = _$PigeonUserDetailsImpl;

  factory _PigeonUserDetails.fromJson(Map<String, dynamic> json) =
      _$PigeonUserDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get displayName;
  @override
  String get photoUrl;

  /// Create a copy of PigeonUserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PigeonUserDetailsImplCopyWith<_$PigeonUserDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
