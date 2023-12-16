import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../controller/question_screen_cubit.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class QuestionPart extends StatelessWidget {
  final String mdQuestion;
  const QuestionPart({super.key, required this.mdQuestion});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionScreenCubit, QuestionScreenState>(
        builder: (context, state) {
      return Markdown(
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
            .copyWith(textScaleFactor: 1.3),
        selectable: true,
        data: mdQuestion.replaceAll(
          "{question_number}",
          ((state as QuestionScreenLoaded).currentQuestionIndex + 1).toString(),
        ),
      );
    });
  }
}
