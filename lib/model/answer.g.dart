// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      questionId: json['questionId'] as String,
      answer: json['answer'] as String,
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']) ??
          Language.unknown,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'questionId': instance.questionId,
      'answer': instance.answer,
      'language': _$LanguageEnumMap[instance.language]!,
    };

const _$LanguageEnumMap = {
  Language.python: 'python',
  Language.c: 'c',
  Language.java: 'java',
  Language.unknown: 'unknown',
};
