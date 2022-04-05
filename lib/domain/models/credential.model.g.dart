// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return Credential(
    token: json['token'] as String,
    identity: json['identity'] as String,
    password: json['password'] as String,
    isPersistent: json['isPersistent'] as bool,
    allowRefresh: json['allowRefresh'] as bool,
    issuedDate: DateTime.parse(json['issuedDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
  );
}

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'token': instance.token,
      'identity': instance.identity,
      'password': instance.password,
      'isPersistent': instance.isPersistent,
      'allowRefresh': instance.allowRefresh,
      'issuedDate': instance.issuedDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
    };
