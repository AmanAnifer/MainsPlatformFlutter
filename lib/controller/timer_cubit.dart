import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mains_platform/other/cog_logger.dart';
import 'timer_enum.dart';
import 'package:mains_platform/other/constants.dart';
part 'timer_cubit.g.dart';

@JsonSerializable()
class TimerState {
  // Duration remainingTime;
  Duration passwordElapsedTime;
  Duration questionElapsedTime;
  Duration get passwordRemainingTime =>
      timerPasswordDuration - passwordElapsedTime;
  Duration get questionRemainingTime =>
      timerQuestionDuration - passwordElapsedTime - questionElapsedTime;

  Duration getRemainingTime(WhichTimer whichTimer) {
    switch (whichTimer) {
      case WhichTimer.password:
        return passwordRemainingTime;

      case WhichTimer.question:
        return questionRemainingTime;
    }
  }

  TimerState({
    // required this.remainingTime,
    required this.questionElapsedTime,
    required this.passwordElapsedTime,
  });

  Map<String, dynamic> toJson() => _$TimerStateToJson(this);
  factory TimerState.fromJson(Map<String, dynamic> json) =>
      _$TimerStateFromJson(json);
}

class TimerCubit extends HydratedCubit<TimerState> {
  bool stopPasswordTimer = false;
  bool stopQuestionTimer = false;
  Stream<int>? genericTimer;

  final String _id;
  Function() questionTimerFinishedCallback;
  Function() passwordTimerFinishedCallback;

  TimerCubit(
    this._id, {
    required this.questionTimerFinishedCallback,
    required this.passwordTimerFinishedCallback,
  }) : super(
          TimerState(
            questionElapsedTime: Duration.zero,
            passwordElapsedTime: Duration.zero,
          ),
        );

  @override
  String get id => _id;

  /// https://github.com/felangel/bloc/issues/2111
  /// This is a workaround for making HydratedCubit work since the state
  /// emitted by HydratedCubit is the first, it will not be detected by listeners
  /// so, intead it is re emited so that listeners are notified
  void reEmit() {
    emit(state);
  }

  void stopTimer(WhichTimer whichTimer) {
    switch (whichTimer) {
      case WhichTimer.password:
        stopPasswordTimer = true;
        break;
      case WhichTimer.question:
        stopQuestionTimer = true;
        break;
    }
  }

  Future<void> startTimer(WhichTimer whichTimer) async {
    bool timerCondition;
    bool isPasswordTimer =
        (whichTimer == WhichTimer.password) ? true : false; // Convenience
    Function() timerFinishedCallback = (whichTimer == WhichTimer.password)
        ? passwordTimerFinishedCallback
        : questionTimerFinishedCallback;

    if (genericTimer == null) {
      genericTimer =
          Stream.periodic(const Duration(seconds: 1), (computationCount) {
        return computationCount;
      }).takeWhile((element) {
        switch (whichTimer) {
          case WhichTimer.password:
            timerCondition = (!state.passwordRemainingTime.isNegative &&
                (state.passwordRemainingTime > Duration.zero) &&
                !stopPasswordTimer);
            break;
          case WhichTimer.question:
            timerCondition = (!state.questionRemainingTime.isNegative &&
                (state.questionRemainingTime > Duration.zero) &&
                !stopQuestionTimer);
            break;
        }
        return timerCondition;
      });
      genericTimer!.listen(
        cancelOnError: true,
        (event) {
          try {
            emit(
              TimerState(
                // passwordElapsedTime: Duration(seconds: event),
                passwordElapsedTime: isPasswordTimer
                    ? state.passwordElapsedTime + const Duration(seconds: 1)
                    : state.passwordElapsedTime,
                questionElapsedTime: !isPasswordTimer // isQuestionTimer
                    ? state.questionElapsedTime + const Duration(seconds: 1)
                    : state.questionElapsedTime,
              ),
            );
          } on StateError {
            return;
          }
        },
        onDone: () {
          var stopTimerCalled = (whichTimer == WhichTimer.password)
              ? stopPasswordTimer
              : stopQuestionTimer;
          if (!stopTimerCalled) {
            // Only call callback function if timer was exhausted
            timerFinishedCallback();
          }
          genericTimer = null;
        },
      );
    }
  }

  @override
  Map<String, dynamic> toJson(TimerState state) {
    try {
      return state.toJson();
    } catch (error, stacktrace) {
      getLogger().severe(
        "toJson failed in TimerCubit's hydration",
        error,
        stacktrace,
      );
      rethrow;
    }
  }

  @override
  TimerState fromJson(Map<String, dynamic> json) {
    getLogger().info("Trying to restore TimerState with json=$json");
    try {
      return TimerState.fromJson(json);
    } catch (error, stacktrace) {
      getLogger().severe(
        "fromJson failed in TimerCubit's hydration, json=$json",
        error,
        stacktrace,
      );
      rethrow;
    }
  }
}
