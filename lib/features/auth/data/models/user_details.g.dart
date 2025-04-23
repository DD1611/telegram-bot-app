// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PigeonUserDetailsImpl _$$PigeonUserDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PigeonUserDetailsImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String? ?? '',
      photoUrl: json['photoUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$PigeonUserDetailsImplToJson(
        _$PigeonUserDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
    };
