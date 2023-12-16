import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

enum Language { python, c, java, unknown }

@JsonSerializable()
class Answer extends Equatable {
  final String questionId;
  final String answer;
  final Language language;
  const Answer({
    required this.questionId,
    required this.answer,
    this.language = Language.unknown,
  });

  @override
  List<Object> get props => [
        questionId,
        answer,
        language,
      ];

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
