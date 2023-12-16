// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerState _$TimerStateFromJson(Map<String, dynamic> json) => TimerState(
      questionElapsedTime:
          Duration(microseconds: json['questionElapsedTime'] as int),
      passwordElapsedTime:
          Duration(microseconds: json['passwordElapsedTime'] as int),
    );

Map<String, dynamic> _$TimerStateToJson(TimerState instance) =>
    <String, dynamic>{
      'passwordElapsedTime': instance.passwordElapsedTime.inMicroseconds,
      'questionElapsedTime': instance.questionElapsedTime.inMicroseconds,
    };
