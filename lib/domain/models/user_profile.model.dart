import 'dart:convert';

import 'package:goob_by_me/app/utils/assets.dart';
import 'package:goob_by_me/core/utils/enumeration.dart';
import 'package:goob_by_me/core/utils/generation.dart';
import 'package:goob_by_me/domain/models/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile implements Entity {
  // Members
  String key;
  String firstName;
  String lastName;
  String displayName;
  GenderType genderType;
  String photoUrl;

  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();

  String get fullName => '$firstName $lastName';

  // Constructors
  UserProfile(
    this.key, {
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.genderType,
    required this.photoUrl,
  });

  // Initialize default UserProfile
  factory UserProfile.def() => UserProfile(
        'profile-' + Generation().key(),
        displayName: 'Guest',
        genderType: GenderType.unknown,
        photoUrl: ImageUrls.defaultProfilePhoto,
        firstName: '',
        lastName: '',
      );

  // Initialize UserProfile with a `Map<String, dynamic>`
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  // Initialize UserProfile with a json string
  factory UserProfile.fromJsonString(String json) =>
      _$UserProfileFromJson(jsonDecode(json));

  // Convert UserProfile to a `Map<String, dynamic>`
  @override
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  // Convert UserProfile to a json `String`
  @override
  String toJsonString() => jsonEncode(_$UserProfileToJson(this));

  @override
  UserProfile clone() => _$UserProfileFromJson(_$UserProfileToJson(this));

  // Object comparison
  @override
  bool compare(Object other) => identical(this, other);

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() => '{"userProfile": ${this.toJsonString()}}';
}
