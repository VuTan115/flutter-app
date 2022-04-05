import 'dart:convert';

import 'package:goob_by_me/domain/models/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credential.model.g.dart';

@JsonSerializable(explicitToJson: true)
class Credential implements Entity {
  // Members
  String token;
  String identity;
  String password;
  bool isPersistent;
  bool allowRefresh;
  DateTime issuedDate;
  DateTime expiryDate;
  // empty Credential
  static Credential empty = Credential(
    token: "",
    identity: "",
    password: '',
    isPersistent: false,
    allowRefresh: true,
    issuedDate: DateTime.now(),
    expiryDate: DateTime.now(),
  );
  // Constructors
  Credential({
    required this.token,
    required this.identity,
    required this.password,
    required this.isPersistent,
    required this.allowRefresh,
    required this.issuedDate,
    required this.expiryDate,
  });

  // Initialize Credential with a `Map<String, dynamic>`
  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);

  // Initialize Credential with a json string
  factory Credential.fromJsonString(String json) =>
      _$CredentialFromJson(jsonDecode(json));

  // Convert Credential to a `Map<String, dynamic>`
  @override
  Map<String, dynamic> toJson() => _$CredentialToJson(this);

  // Convert Credential to a json `String`
  @override
  String toJsonString() => jsonEncode(_$CredentialToJson(this));

  @override
  Credential clone() => _$CredentialFromJson(_$CredentialToJson(this));

  // Object comparison
  @override
  bool compare(Object other) => identical(this, other);

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => '{"credential": ${this.toJsonString()}}';
}
