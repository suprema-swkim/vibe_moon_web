import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UserModel {
  int? userId;
  String? userEmail;
  String? userName;
  String? userPhoneNumber;
  String? userRole;
  int? createdAt;
  int? updatedAt;

  UserModel({
    this.userId,
    this.userEmail,
    this.userName,
    this.userPhoneNumber,
    this.userRole,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

