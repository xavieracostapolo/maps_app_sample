// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      idUser: json['idUser'] as String,
      edad: json['edad'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'idUser': instance.idUser,
      'edad': instance.edad,
    };
