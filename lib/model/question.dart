import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

enum Difficulty { easy, medium, hard }

@JsonSerializable()
class Question extends Equatable {
  final String questionId;
  final String markdownQuestionString;
  const Question({
    required this.questionId,
    required this.markdownQuestionString,
  });

  @override
  List<Object> get props => [
        questionId,
        markdownQuestionString,
      ];

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
