import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:mains_platform/controller/central_hive_cubit.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:mains_platform/other/routes.dart';
import '../controller/password_cubit.dart';
import 'question_screen_widgets/timer_widget.dart';
import '../controller/timer_cubit.dart';
import '../controller/timer_enum.dart';
import 'package:mains_platform/other/strings.dart';
import 'package:mains_platform/other/injection.dart';

class PasswordScreen extends StatefulWidget {
  final String id;
  const PasswordScreen({
    super.key,
    required this.id,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isFirstState = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CentralHiveCubit()),
        BlocProvider(
          create: (context) => PasswordCubit(
            widget.id,
            questionsRepository: sl(),
          ),
        ),
        BlocProvider(
          create: (context) => TimerCubit(
            widget.id,
            questionTimerFinishedCallback: () {},
            passwordTimerFinishedCallback: () async {
              if (mounted) {
                final state = context.read<PasswordCubit>().state;
                switch (state) {
                  case PasswordIncomplete():
                    final correctPassword = await context
                        .read<PasswordCubit>()
                        .getCorrectPassword();
                    final passwordTimeRemoved = timerPasswordDuration.inMinutes;
                    if (mounted) {
                      showDialog<void>(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Time's up!"),
                              content: Text(
                                  "You couldn't find the password in time. The password is \"$correctPassword\".\n $passwordTimeRemoved minutes will be reduced from your main test time."),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok"))
                              ],
                            );
                          });
                    }
                    _passwordController.text = correctPassword;
                  default:
                    break;
                }
              }
            },
          ),
        ),
      ],
      child: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {
          // getLogger().info("PasswordState is $state");
          switch (state) {
            case PasswordComplete():
              if (mounted) {
                context.read<TimerCubit>().stopTimer(WhichTimer.password);
                context.goNamed(
                  Routes.questionScreen,
                  pathParameters: {
                    pathParameterIdKey: widget.id,
                    pathParameterIsAdminKey: false.toString(),
                  },
                );
              }
            case PasswordIncomplete():
              _formKey.currentState?.validate();
            default:
              break;
          }
        },
        // buildWhen: (previous, current) {
        //   print("Previous $previous  Current $current");
        //   return true;
        // },
        builder: (context, state) {
          if (_isFirstState) {
            context.read<PasswordCubit>().reEmit();
            _isFirstState = false;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text(windowTitle),
              centerTitle: true,
            ),
            body: Center(
              child: switch (state) {
                PasswordIncomplete(:final passwordHint) => LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: constraints.maxHeight * 0.8),
                            width: constraints.maxWidth * 0.4,
                            height: constraints.maxHeight * 0.8,
                            padding: const EdgeInsets.fromLTRB(70, 50, 70, 50),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Text(
                                    "Crack the password",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  const Spacer(),
                                  Markdown(
                                    data: passwordHint,
                                    shrinkWrap: true,
                                    styleSheet: MarkdownStyleSheet.fromTheme(
                                            Theme.of(context))
                                        .copyWith(textScaleFactor: 1.2),
                                  ),
                                  const Spacer(),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Password",
                                    ),
                                    onFieldSubmitted: (value) => context
                                        .read<PasswordCubit>()
                                        .checkPassword(
                                          _passwordController.text,
                                        ),
                                    validator: ((value) {
                                      final actualState =
                                          context.read<PasswordCubit>().state;
                                      switch (actualState) {
                                        case PasswordIncomplete(:final isWrong):
                                          if (isWrong) {
                                            return "Nope! Not correct";
                                          } else {
                                            return "Not correct";
                                          }
                                        default:
                                          return null;
                                      }
                                    }),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<PasswordCubit>()
                                            .checkPassword(
                                              _passwordController.text,
                                            );
                                      },
                                      child: Text(
                                        "Check password",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const TimerWidget(
                            whichTimer: WhichTimer.password,
                          ),
                        ],
                      );
                    },
                  ),
                _ => const CircularProgressIndicator(),
              },
            ),
          );
        },
      ),
    );
  }
}
