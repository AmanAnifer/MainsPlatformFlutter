// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasswordInitialImpl _$$PasswordInitialImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordInitialImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PasswordInitialImplToJson(
        _$PasswordInitialImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PasswordIncompleteImpl _$$PasswordIncompleteImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordIncompleteImpl(
      passwordHint: json['passwordHint'] as String,
      isWrong: json['isWrong'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PasswordIncompleteImplToJson(
        _$PasswordIncompleteImpl instance) =>
    <String, dynamic>{
      'passwordHint': instance.passwordHint,
      'isWrong': instance.isWrong,
      'runtimeType': instance.$type,
    };

_$PasswordCompleteImpl _$$PasswordCompleteImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordCompleteImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PasswordCompleteImplToJson(
        _$PasswordCompleteImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PasswordErrorImpl _$$PasswordErrorImplFromJson(Map<String, dynamic> json) =>
    _$PasswordErrorImpl(
      error: json['error'] as String,
      stacktrace: json['stacktrace'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PasswordErrorImplToJson(_$PasswordErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'stacktrace': instance.stacktrace,
      'runtimeType': instance.$type,
    };
