import 'dart:convert';

import 'package:goob_by_me/core/utils/extensions.dart';
import 'package:goob_by_me/core/utils/generation.dart';
import 'package:goob_by_me/domain/models/credential.model.dart';
import 'package:goob_by_me/domain/models/entity.dart';
import 'package:goob_by_me/domain/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'principal.model.g.dart';

@JsonSerializable(explicitToJson: true)
class Principal implements Entity {
  // Members
  String key;
  User user;
  Credential credential;
  Map<String, Object> authority;

  bool get isAuthenticated => credential.expiryDate.isAfter(DateTime.now());

  // Constructors
  Principal(
    this.key, {
    required this.user,
    required this.authority,
    required this.credential,
  });

  // Initialize default Principal
  factory Principal.def() => Principal(Generation().uuid(),
      user: User.def(), authority: {}, credential: Credential.empty);

  // Initialize Principal with a `Map<String, dynamic>`
  factory Principal.fromJson(Map<String, dynamic> json) =>
      _$PrincipalFromJson(json);

  // Initialize Principal with a json string
  factory Principal.fromJsonString(String json) =>
      _$PrincipalFromJson(jsonDecode(json));

  // Convert Principal to a `Map<String, dynamic>`
  @override
  Map<String, dynamic> toJson() => _$PrincipalToJson(this);

  // Convert Principal to a json `String`
  @override
  String toJsonString() => jsonEncode(_$PrincipalToJson(this));

  @override
  Principal clone() => _$PrincipalFromJson(_$PrincipalToJson(this));

  // Object comparison
  @override
  bool compare(Object other) => identical(this, other);

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() => '{"principal": ${this.toJsonString()}}';
}
