import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/question_screen_cubit.dart';

class PageButtonPart extends StatelessWidget {
  PageButtonPart({super.key});
  final List<int> indexes = List.generate(5, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionScreenCubit, QuestionScreenState>(
      builder: (context, state) {
        switch (state) {
          case QuestionScreenLoaded(
              :final questions,
              :final currentQuestionIndex
            ):
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(questions.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionChip(
                      // shape: CircleBorder(
                      //   side: BorderSide(),
                      // ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      label: Text(
                        (index + 1).toString(),
                      ),
                      backgroundColor: currentQuestionIndex == index
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : null,
                      onPressed: () {
                        _changeTheme(context); // Fluff
                        context
                            .read<QuestionScreenCubit>()
                            .changeQuestionToIndex(index);
                      }),
                );
              }),
            );
          default:
            return Container();
        }
      },
    );
  }
}

void _changeTheme(BuildContext context) {
  // context.read<ThemeCubit>().changeThemeColor();
}
