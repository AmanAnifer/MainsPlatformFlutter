import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mains_platform/data/question_repository.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:mains_platform/other/cog_logger.dart';

sealed class WelcomeState {}

class WelcomeInitial implements WelcomeState {
  const WelcomeInitial();
}

class WelcomeNetworkError implements WelcomeState {
  const WelcomeNetworkError();
}

class WelcomeWaiting implements WelcomeState {
  final bool isWaitingForStartSignal;
  final bool isProcessing;
  const WelcomeWaiting({
    required this.isWaitingForStartSignal,
    this.isProcessing = false,
  });
}

class WelcomeFinished implements WelcomeState {
  const WelcomeFinished();
}

class WelcomeCubit extends Cubit<WelcomeState> {
  StringBuffer typedUpTillNow = StringBuffer();
  final QuestionsRepository questionsRepository;
  WelcomeCubit({
    required this.questionsRepository,
  }) : super(const WelcomeInitial()) {
    emit(
      const WelcomeWaiting(
        isWaitingForStartSignal: false,
      ),
    );
  }

  void adminPassthrough() {
    emit(const WelcomeFinished());
  }

  void addAndCheckCheatCode({required String key}) {
    typedUpTillNow.write(key);
    if (typedUpTillNow.toString().contains(adminCheatCode)) {
      emit(const WelcomeFinished());
    }
  }

  void checkStartSignal() async {
    try {
      emit(
        const WelcomeWaiting(
          isWaitingForStartSignal: false,
          isProcessing: true,
        ),
      );
      final canStartTest = await questionsRepository.canStartTest();
      if (canStartTest) {
        emit(const WelcomeFinished());
      } else {
        emit(
          const WelcomeWaiting(
            isWaitingForStartSignal: true,
            isProcessing: false,
          ),
        );
      }
    } catch (error, stacktrace) {
      getLogger().severe(
        "Error on checkStartSignal in WelcomeCubit",
        error,
        stacktrace,
      );
      emit(const WelcomeNetworkError());
    }
  }
}
