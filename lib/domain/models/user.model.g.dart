// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['key'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    status: _$enumDecode(_$UserStatusEnumMap, json['status']),
    profile: UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'status': _$UserStatusEnumMap[instance.status],
      'profile': instance.profile.toJson(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$UserStatusEnumMap = {
  UserStatus.unknown: 0,
  UserStatus.approving: 1,
  UserStatus.activated: 2,
  UserStatus.expired: 3,
  UserStatus.locked: 4,
  UserStatus.deleted: 5,
};
