// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Principal _$PrincipalFromJson(Map<String, dynamic> json) {
  return Principal(
    json['key'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    authority: (json['authority'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, e as Object),
    ),
    credential: Credential.fromJson(json['credential'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrincipalToJson(Principal instance) => <String, dynamic>{
      'key': instance.key,
      'user': instance.user.toJson(),
      'credential': instance.credential.toJson(),
      'authority': instance.authority,
    };
