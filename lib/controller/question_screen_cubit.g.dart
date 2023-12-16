// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_screen_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionScreenInitialImpl _$$QuestionScreenInitialImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionScreenInitialImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuestionScreenInitialImplToJson(
        _$QuestionScreenInitialImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$QuestionScreenLoadingImpl _$$QuestionScreenLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionScreenLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuestionScreenLoadingImplToJson(
        _$QuestionScreenLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$QuestionScreenErrorImpl _$$QuestionScreenErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionScreenErrorImpl(
      error: json['error'] as String,
      stackTraceString: json['stackTraceString'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuestionScreenErrorImplToJson(
        _$QuestionScreenErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'stackTraceString': instance.stackTraceString,
      'runtimeType': instance.$type,
    };

_$QuestionScreenTimeFinishedImpl _$$QuestionScreenTimeFinishedImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionScreenTimeFinishedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuestionScreenTimeFinishedImplToJson(
        _$QuestionScreenTimeFinishedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$QuestionScreenLoadedImpl _$$QuestionScreenLoadedImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionScreenLoadedImpl(
      currentQuestionIndex: json['currentQuestionIndex'] as int,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers: (json['answers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                int.parse(k), Answer.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      showPageButtons: json['showPageButtons'] as bool? ?? false,
      showNextButton: json['showNextButton'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuestionScreenLoadedImplToJson(
        _$QuestionScreenLoadedImpl instance) =>
    <String, dynamic>{
      'currentQuestionIndex': instance.currentQuestionIndex,
      'questions': instance.questions,
      'answers': instance.answers.map((k, e) => MapEntry(k.toString(), e)),
      'showPageButtons': instance.showPageButtons,
      'showNextButton': instance.showNextButton,
      'runtimeType': instance.$type,
    };
