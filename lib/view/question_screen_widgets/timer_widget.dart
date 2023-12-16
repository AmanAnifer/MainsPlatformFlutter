import 'package:flutter/material.dart';
import '../../controller/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/timer_enum.dart';

class TimerWidget extends StatefulWidget {
  final WhichTimer whichTimer;
  const TimerWidget({super.key, required this.whichTimer});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        context.read<TimerCubit>().startTimer(widget.whichTimer);
        var remainingDurationText =
            state.getRemainingTime(widget.whichTimer).toString();
        return Container(
          // color: Colors.black,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),

          padding: const EdgeInsets.all(10),
          child: Text(
            "Remaining: ${remainingDurationText.substring(0, remainingDurationText.length - 7)}",
          ),
        );
      },
    );
  }
}
