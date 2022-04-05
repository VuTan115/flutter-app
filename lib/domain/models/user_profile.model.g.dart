// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    json['key'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    displayName: json['displayName'] as String,
    genderType: _$enumDecode(_$GenderTypeEnumMap, json['genderType']),
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'key': instance.key,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'genderType': _$GenderTypeEnumMap[instance.genderType],
      'photoUrl': instance.photoUrl,
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

const _$GenderTypeEnumMap = {
  GenderType.unknown: 0,
  GenderType.male: 1,
  GenderType.female: 2,
};
