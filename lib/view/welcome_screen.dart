import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mains_platform/controller/welcome_cubit.dart';
import 'package:mains_platform/other/strings.dart' as strings;
import 'package:metaballs/metaballs.dart';
import 'package:mains_platform/other/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:mains_platform/other/injection.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(questionsRepository: sl()),
      child: BlocConsumer<WelcomeCubit, WelcomeState>(
        listener: (context, state) {
          switch (state) {
            case WelcomeFinished():
              context.go(Routes.startFormScreen);
            default:
              break;
          }
        },
        builder: (context, state) {
          return RawKeyboardListener(
            focusNode: FocusNode()..requestFocus(),
            autofocus: true,
            onKey: (value) async {
              if (value is RawKeyDownEvent) {
                context.read<WelcomeCubit>().addAndCheckCheatCode(
                    key: value.logicalKey.keyLabel); // Admin cheat code
                if (value.logicalKey == LogicalKeyboardKey.space) {
                  context.read<WelcomeCubit>().checkStartSignal();
                }
              }
            },
            child: Scaffold(
              body: Stack(
                children: [
                  Metaballs(
                    effect: MetaballsEffect.speedup(),
                    gradient: const LinearGradient(
                      colors: [
                        metaballGradiantStartColor,
                        metaballGradiantEndColor,
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                    metaballs: 40,
                    animationDuration: const Duration(milliseconds: 200),
                    speedMultiplier: 1,
                    bounceStiffness: 3,
                    minBallRadius: 15,
                    maxBallRadius: 40,
                    glowRadius: 0.4,
                    glowIntensity: 0.6,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          strings.uiWelcomeScreenCongrats,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        switch (state) {
                          WelcomeWaiting(
                            :final isWaitingForStartSignal,
                            :final isProcessing
                          ) =>
                            isProcessing
                                ? const CircularProgressIndicator()
                                : Text(
                                    isWaitingForStartSignal
                                        ? strings.uiWelcomeScreenWaitTillSignal
                                        : strings.uiWelcomeScreenPressSpace,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                          WelcomeNetworkError() => Text(
                              strings.uiWelcomeScreenNetworkError,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.redAccent,
                                  ),
                            ),
                          _ => Container(),
                        }
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
