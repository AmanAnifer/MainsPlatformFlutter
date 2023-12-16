import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/services.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  final confettiController = ConfettiController(
    duration: const Duration(seconds: 10),
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => confettiController.play());
    // Future.delayed(
    //   const Duration(seconds: 10),
    //   () async {
    //     await launchUrlString(feedbackFormLink);
    //   },
    // );
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clash of Geeks"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  constraints:
                      BoxConstraints(maxHeight: constraints.maxHeight * 0.8),
                  width: constraints.maxWidth * 0.6,
                  height: constraints.maxHeight * 0.8,
                  padding: const EdgeInsets.fromLTRB(70, 50, 70, 50),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: [
                          const TextSpan(
                            text: """Thank you for participating in our event.
We hope to see you again next time!

Please fill this feedback form: """,
                          ),
                          TextSpan(
                            text: "Click here",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.blue,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchUrlString(feedbackFormLink);
                                await SystemNavigator.pop();
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              // blastDirection:
              //     5 * pi / 4, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              // blastDirection:
              //     -pi / 4, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ConfettiWidget(
              confettiController: confettiController,
              // blastDirection:
              // 3 * pi / 4, // don't specify a direction, blast randomly
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ConfettiWidget(
              // blastDirection: pi / 4,
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ),
        ],
      ),
    );
  }
}
