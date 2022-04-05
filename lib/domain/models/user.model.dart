import 'dart:convert';

import 'package:goob_by_me/core/utils/enumeration.dart';
import 'package:goob_by_me/core/utils/generation.dart';
import 'package:goob_by_me/domain/models/entity.dart';
import 'package:goob_by_me/domain/models/user_profile.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(explicitToJson: true)
class User implements Entity {
  // Members
  String key;
  String name;
  String email;
  String phone;
  UserStatus status;
  UserProfile profile;

  // Constructors
  User(
    this.key, {
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.profile,
  });

  // Initialize default User
  factory User.def() => User(
        'user-' + Generation().key(),
        status: UserStatus.unknown,
        profile: UserProfile.def(),
        email: '',
        name: '',
        phone: '',
      );

  // Initialize User with a `Map<String, dynamic>`
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // // Initialize User with a json string
  // factory User.fromJsonString(String json) => _$UserFromJson(jsonDecode(json));

  // // Convert User to a `Map<String, dynamic>`
  // @override
  // Map<String, dynamic> toJson() => _$UserToJson(this);

  // // Convert User to a json `String`
  // @override
  // String toJsonString() => jsonEncode(_$UserToJson(this));

  // @override
  // User clone() => _$UserFromJson(_$UserToJson(this));

  // Object comparison
  @override
  bool compare(Object other) => identical(this, other);

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() => '{"user": ${this.toJsonString()}}';

  @override
  clone() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  toJsonString() {
    // TODO: implement toJsonString
    throw UnimplementedError();
  }
}
