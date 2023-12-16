import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mains_platform/other/routes.dart';
import 'package:mains_platform/other/strings.dart';
import '../controller/question_screen_cubit.dart';
import 'question_screen_widgets/answer_part.dart';
import 'question_screen_widgets/question_part.dart';
import 'question_screen_widgets/timer_widget.dart';
import 'question_screen_widgets/page_button.dart';
import '../controller/central_hive_cubit.dart';
import '../controller/timer_cubit.dart';
import '../controller/timer_enum.dart';
import 'package:mains_platform/other/injection.dart';

class QuestionScreen extends StatefulWidget {
  final String id;
  final bool isAdmin;
  const QuestionScreen({
    super.key,
    required this.id,
    required this.isAdmin,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool _isFirstQuestionState = true;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CentralHiveCubit()),
        BlocProvider(
          create: (context) => QuestionScreenCubit(
            // (widget.isAdmin)
            //     ? getRandomIdForAdminViewOfUser(widget.id)
            //     :
            widget.id,
            questionSource: sl(),
            isAdmin: widget.isAdmin,
          ),
        ),
        BlocProvider(
          create: (context) => TimerCubit(
            // (widget.isAdmin)
            //     ? getRandomIdForAdminViewOfUser(widget.id)
            //     :
            widget.id,
            questionTimerFinishedCallback: () {
              context.read<QuestionScreenCubit>().timeFinished();
            },
            passwordTimerFinishedCallback: () {},
          ),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: const Text(windowTitle),
            centerTitle: true,
            actions: [
              ...(widget.isAdmin)
                  ? [
                      Builder(
                        builder: (context) {
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<QuestionScreenCubit>()
                                  .getQuestions();
                            },
                            icon: const Icon(Icons.refresh),
                          );
                        },
                      )
                    ]
                  : [],
              TextButton(
                onPressed: () {
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "Rules",
                    barrierColor: Colors.black45.withAlpha(200),
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Dialog(
                        // backgroundColor: Colors.black45.withAlpha(200),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Rules",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  rulesTest,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                    );
                                  },
                                  child: const Text(
                                    "Understood",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  /*
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Colors.transparent,
                    // barrierLabel: "rules",
                    builder: (context) {
                      return Material(
                        child: Dialog(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Rules",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      rulesTest,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(
                                          context,
                                        );
                                      },
                                      child: Text(
                                        "Understood",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  */
                },
                child: const Text("Rules"),
              ),
            ],
          ),
          body: BlocConsumer<QuestionScreenCubit, QuestionScreenState>(
            listener: (context, state) async {
              switch (state) {
                case QuestionScreenTimeFinished():
                  if (mounted) {
                    await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Time's up!"),
                          content: const Text(
                              "You've finished the alloted time.\nAll your entered data will be saved."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Ok"))
                          ],
                        );
                      },
                    ).then(
                      (value) {
                        context.go(Routes.endScreen);
                      },
                    );
                  }
                  break;
                default:
                  break;
              }
            },
            builder: (context, state) {
              if (_isFirstQuestionState) {
                context.read<QuestionScreenCubit>().reEmit();
                _isFirstQuestionState = false;
              }

              // if (widget.isAdmin) {
              //   // We don't need no cache when we're admin
              //   // We do need the latest data
              //   context.read<QuestionScreenCubit>().clear();
              //   context.read<TimerCubit>().clear();
              // }

              switch (state) {
                case QuestionScreenLoading():
                case QuestionScreenTimeFinished():
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 40,
                        ),
                        Text("Hold tight, loading questions..."),
                      ],
                    ),
                  );
                case QuestionScreenLoaded(
                    :final questions,
                    :final currentQuestionIndex,
                    :final showNextButton,
                    :final showPageButtons,
                  ):
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        padding: const EdgeInsets.fromLTRB(70, 50, 70, 50),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: QuestionPart(
                                      mdQuestion:
                                          questions[currentQuestionIndex]
                                              .markdownQuestionString,
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * (2.5 / 4),
                                    width: 40,
                                    child: const VerticalDivider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    // height: constraints.maxHeight * (2.5 / 4),
                                    // width: (constraints.maxWidth - 180) / 2,
                                    child: AnswerPart(
                                      key:
                                          GlobalObjectKey(currentQuestionIndex),
                                      answerText: context
                                          .read<QuestionScreenCubit>()
                                          .getCurrentQuestionAnswer(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            const TimerWidget(
                              whichTimer: WhichTimer.question,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: state.currentQuestionIndex == 0
                                        ? null
                                        : () {
                                            _changeTheme(context); // Fluff
                                            context
                                                .read<QuestionScreenCubit>()
                                                .changeQuestionToIndex(
                                                  state.currentQuestionIndex -
                                                      1,
                                                );
                                          },
                                    child: Text(
                                      "  Previous  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                                (showPageButtons || widget.isAdmin)
                                    ? PageButtonPart()
                                    : Container(),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: (showNextButton ||
                                            widget.isAdmin)
                                        ? (state.currentQuestionIndex ==
                                                state.questions.length - 1
                                            ? () {
                                                confirmDialog(
                                                  context,
                                                  widget.id,
                                                );
                                              }
                                            : () {
                                                _changeTheme(context); // Fluff
                                                context
                                                    .read<QuestionScreenCubit>()
                                                    .changeQuestionToIndex(
                                                      state.currentQuestionIndex +
                                                          1,
                                                    );
                                              })
                                        : null,
                                    child: Text(
                                      state.currentQuestionIndex ==
                                              state.questions.length - 1
                                          ? "Finish test"
                                          : "     Next     ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                case QuestionScreenError(:final error, :final stackTraceString):
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Contact Invigilator",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: Colors.red),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          error,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.red),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          stackTraceString,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  );
                case QuestionScreenInitial():
                  // default:
                  return const Center(
                    child: Text("Contact invigilator"),
                  );
              }
            },
          )),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: context.read<TimerCubit>(),
              ),
              BlocProvider.value(
                value: context.read<QuestionScreenCubit>(),
              ),
            ],
            child: AlertDialog(
              title: const Text("Finish?"),
              content: const Text(
                  "Are you sure you want to finish the test?\nYou cannot come back again."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "No",
                  ),
                ),
                TextButton(
                  onPressed: (widget.isAdmin)
                      ? () {}
                      : () {
                          context
                              .read<TimerCubit>()
                              .stopTimer(WhichTimer.question);
                          Navigator.of(context).pop();
                          context
                              .read<QuestionScreenCubit>()
                              .updateFirebaseAnswer();
                          context
                              .read<QuestionScreenCubit>()
                              .updateFinishedFirebase();
                          context.go(Routes.endScreen);
                        },
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        });
  }
}

void _changeTheme(BuildContext context) {
  // context.read<ThemeCubit>().changeThemeColor();
}
