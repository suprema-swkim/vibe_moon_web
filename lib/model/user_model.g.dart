// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: (json['userId'] as num?)?.toInt(),
      userEmail: json['userEmail'] as String?,
      userName: json['userName'] as String?,
      userPhoneNumber: json['userPhoneNumber'] as String?,
      userRole: json['userRole'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      if (instance.userId case final value?) 'userId': value,
      if (instance.userEmail case final value?) 'userEmail': value,
      if (instance.userName case final value?) 'userName': value,
      if (instance.userPhoneNumber case final value?) 'userPhoneNumber': value,
      if (instance.userRole case final value?) 'userRole': value,
      if (instance.createdAt case final value?) 'createdAt': value,
      if (instance.updatedAt case final value?) 'updatedAt': value,
    };
