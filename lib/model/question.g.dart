// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      questionId: json['questionId'] as String,
      markdownQuestionString: json['markdownQuestionString'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'questionId': instance.questionId,
      'markdownQuestionString': instance.markdownQuestionString,
    };
