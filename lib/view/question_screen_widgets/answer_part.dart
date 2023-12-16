import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/question_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:code_text_field/code_text_field.dart' as ctf;
// import 'package:any_syntax_highlighter/any_syntax_highlighter.dart' as ash;
part 'tabkey_logic.dart';

class TextEditingControllerWorkaroud extends TextEditingController {
  TextEditingControllerWorkaroud({super.text});

  void setTextAndPosition(String newText, {int? caretPosition}) {
    int offset = caretPosition ?? newText.length;
    value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: offset),
        composing: TextRange.empty);
  }
}

class AnswerPart extends StatefulWidget {
  // var rawFocusNode = FocusNode();
  final String answerText;
  const AnswerPart({
    super.key,
    required this.answerText,
  });
  // final QuestionScreenCubit questionScreenCubit;
  @override
  State<AnswerPart> createState() => _AnswerPartState();
}

class _AnswerPartState extends State<AnswerPart> {
  final controller = TextEditingControllerWorkaroud();
  final textFocusNode = FocusNode();
  final answerTextInputColor = Colors.grey[900];

  @override
  void initState() {
    super.initState();
    controller.setTextAndPosition(widget.answerText);
    controller.addListener(
      () {
        var offset = controller.selection.base.offset;
        context.read<QuestionScreenCubit>().setAnswer(controller.text, offset);
      },
    );
    // textFocusNode.addListener(() {
    //   if (!textFocusNode.hasFocus) {
    //     textFocusNode.requestFocus()
    //   }
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionScreenCubit, QuestionScreenState>(
        builder: (context, state) {
      // String answerText =
      //     context.read<QuestionScreenCubit>().getCurrentQuestionAnswer();
      // int cursor = 0;
      // if (state is QuestionScreenStateLoaded) {
      //   cursor = state.answerOffset ?? answerText.length;
      // }
      // print(cursor);
      // widget._controller.setTextAndPosition(answerText, caretPosition: cursor);
      return Actions(
          actions: {InsertTabIntent: InsertTabAction()},
          child: Shortcuts(
            shortcuts: {
              LogicalKeySet(LogicalKeyboardKey.tab):
                  InsertTabIntent(4, controller)
            },
            child: TextFormField(
                controller: controller,
                focusNode: textFocusNode,
                autofocus: true,
                textInputAction: TextInputAction.newline,
                maxLines: 100,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(fontFamily: "monospace"),
                decoration: InputDecoration(
                  // hoverColor: Theme.of(context).inputDecorationTheme.fillColor,
                  // focusColor: Theme.of(context).inputDecorationTheme.fillColor,
                  // fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  fillColor: answerTextInputColor,
                  focusColor: answerTextInputColor,
                  hoverColor: answerTextInputColor,

                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  filled: true,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                )),
          ));
    });
  }
}
