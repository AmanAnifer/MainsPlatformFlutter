import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mains_platform/data/question_repository.dart';
import '../model/question.dart';
import '../model/answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mains_platform/other/cog_logger.dart';
part 'question_screen_cubit.freezed.dart';
part 'question_screen_cubit.g.dart';

@freezed
sealed class QuestionScreenState with _$QuestionScreenState {
  factory QuestionScreenState.initial() = QuestionScreenInitial;
  factory QuestionScreenState.loading() = QuestionScreenLoading;
  factory QuestionScreenState.error({
    required String error,
    required String stackTraceString,
  }) = QuestionScreenError;
  factory QuestionScreenState.timeFinished() = QuestionScreenTimeFinished;
  factory QuestionScreenState.loaded({
    required int currentQuestionIndex,
    required List<Question> questions,
    @Default({}) Map<int, Answer> answers,
    @Default(false) bool showPageButtons,
    @Default(false) bool showNextButton,
  }) = QuestionScreenLoaded;

  factory QuestionScreenState.fromJson(Map<String, dynamic> json) =>
      _$QuestionScreenStateFromJson(json);
}

class QuestionScreenCubit extends HydratedCubit<QuestionScreenState> {
  final String _id;
  final bool isAdmin;
  final QuestionsRepository questionSource;
  QuestionScreenCubit(
    this._id, {
    required this.questionSource,
    required this.isAdmin,
  }) : super(QuestionScreenInitial()) {
    switch (state) {
      case QuestionScreenInitial():
      case QuestionScreenState() when isAdmin:
        // If its the admin, then there should be no hydrated restoring, it should
        //  load the questions always from online, never from admin PC's hydrated storage
        getQuestions();
      default:
        break;
    }
  }

  @override
  String get id => _id;

  /// https://github.com/felangel/bloc/issues/2111
  /// This is a workaround for making HydratedCubit work since the state
  /// emitted by HydratedCubit is the first, it will not be detected by listeners
  /// so, intead it is re emited so that listeners are notified
  Future<void> reEmit() async {
    await Future.delayed(
      Duration.zero,
      () {
        emit(state);
      },
    );
  }

  Future<void> getQuestions() async {
    emit(QuestionScreenLoading());
    while (true) {
      try {
        final questions = await questionSource.getQuestions();
        if (!isAdmin) {
          questions.shuffle();
          emit(QuestionScreenLoaded(
            currentQuestionIndex: 0,
            questions: questions,
          ));
        } else {
          final answers =
              await questionSource.adminGetAnswersOfUser(userId: id);
          emit(
            QuestionScreenLoaded(
              currentQuestionIndex: 0,
              questions: questions,
              answers:
                  _getIndexMappedAnswers(answers, questionsAsAdmin: questions),
              showNextButton: true,
              showPageButtons: true,
            ),
          );
        }

        break;
      } on TypeError catch (error, stackTrace) {
        getLogger().severe(
          "TypeError on getQuestions in QuestionScreenCubit",
          error,
          stackTrace,
        );
        emit(
          QuestionScreenError(
            error: error.toString(),
            stackTraceString: stackTrace.toString(),
          ),
        );
        break;
      } catch (error, stacktrace) {
        getLogger().severe(
          "Error on getQuestions in QuestionScreenCubit",
          error,
          stacktrace,
        );
        await Future.delayed(const Duration(seconds: 1));
        continue;
      }
    }
  }

  // Future<void> restoreUserStateByAdmin(Map<String?, dynamic>? answers) async {
  //   print("REstoring");
  //   await getQuestions();
  //   var localState = state; // For type promotion
  //   if (localState is QuestionScreenLoaded) {
  //     emit(QuestionScreenLoaded(
  //       currentQuestionIndex: localState.currentQuestionIndex,
  //       questions: localState.questions,
  //       answers: _getIndexMappedAnswers(answers),
  //     ));
  //   }
  // }

  Map<int, Answer> _getIndexMappedAnswers(
      Map<String?, dynamic>? idMappedAnswers,
      {List<Question>? questionsAsAdmin}) {
    Map<int, Answer> answers = {};
    List<Question> questions;
    if (isAdmin) {
      assert(questionsAsAdmin != null);
      questions = questionsAsAdmin!;
    } else {
      questions = (state as QuestionScreenLoaded).questions;
    }
    questions.asMap().forEach((key, value) {
      answers[key] = Answer(
        answer: idMappedAnswers?[value.questionId] ?? "",
        questionId: value.questionId,
      );
    });

    return answers;
  }

  Future<void> updateFirebaseAnswer() async {
    try {
      if (!isAdmin) {
        switch (state) {
          case QuestionScreenLoaded(
              :final currentQuestionIndex,
              :final questions,
            ):
            final currentQuestionId =
                questions[currentQuestionIndex].questionId;
            final currentQuestionAnswer = getCurrentQuestionAnswer();
            await questionSource.submitAnswerForUser(
              userId: id,
              answer: Answer(
                questionId: currentQuestionId,
                answer: currentQuestionAnswer,
              ),
            );
          default:
            break;
        }
      }
    } catch (error, stacktrace) {
      getLogger().severe(
        "Error on updateFirebaseAnswer in QuestionScreenCubit",
        error,
        stacktrace,
      );
    }
  }

  Future<void> changeQuestionToIndex(int number) async {
    switch (state) {
      case QuestionScreenLoaded(:final showPageButtons, :final questions):
        bool nextShowNextButton = false;
        bool nextShowPageButtons = false;
        if (getCurrentQuestionAnswer(number) != "") {
          nextShowNextButton = true;
        }
        if (number == questions.length - 1 || showPageButtons) {
          nextShowPageButtons = true;
        }
        if (isAdmin) {
          emit(
            (state as QuestionScreenLoaded).copyWith(
              currentQuestionIndex: number,
            ),
          );
        } else {
          updateFirebaseAnswer();
          emit(
            (state as QuestionScreenLoaded).copyWith(
              currentQuestionIndex: number,
              showNextButton: nextShowNextButton,
              showPageButtons: nextShowPageButtons,
            ),
          );
        }
      default:
        break;
    }
  }

  String getCurrentQuestionAnswer([int? index]) {
    switch (state) {
      case QuestionScreenLoaded(:final answers, :final currentQuestionIndex):
        index ??= currentQuestionIndex;
        return answers[index]?.answer ?? "";
      default:
        return "";
    }
  }

  Future<void> setAnswer(String newAnswerText, [int? answerOffset]) async {
    if (!isAdmin) {
      switch (state) {
        case QuestionScreenLoaded(
            currentQuestionIndex: final index,
            :final answers,
            :final questions,
          ):
          var newAnswers = {
            ...answers
          }; // Making copy, since we can't modify final map
          newAnswers[index] = Answer(
            questionId: questions[index].questionId,
            answer: newAnswerText,
          );
          bool showNextButton = false;
          if (newAnswerText != "") {
            showNextButton = true;
          }
          emit(
            (state as QuestionScreenLoaded).copyWith(
              answers: newAnswers,
              showNextButton: showNextButton,
            ),
          );
        default:
          break;
      }
    }
  }

  Future<void> timeFinished() async {
    if (!isAdmin) {
      await updateFirebaseAnswer();
      await updateFinishedFirebase();
      emit(QuestionScreenTimeFinished());
    }
  }

  Future<void> updateFinishedFirebase() async {
    try {
      await questionSource.setTestFinishedForUser(userId: id);
    } catch (error, stacktrace) {
      getLogger().severe(
        "Error on updateFinishedFirebase in QuestionScreenCubit",
        error,
        stacktrace,
      );
    }
  }

  @override
  Map<String, dynamic> toJson(QuestionScreenState state) {
    try {
      getLogger().info("Exporting QuestionScreenState");
      return state.toJson();
    } catch (error, stacktrace) {
      getLogger().severe(
        "toJson failed for QuestionScreenCubits's hydration",
        error,
        stacktrace,
      );
      rethrow;
    }
  }

  @override
  QuestionScreenState fromJson(Map<String, dynamic> json) {
    try {
      getLogger().info("Trying to restore QuestionScreenState json=$json");
      final decodedState = QuestionScreenState.fromJson(json);
      getLogger().info("Decoded QuestionScreenState $decodedState");
      return decodedState;
    } catch (error, stacktrace) {
      getLogger().severe(
        "fromJson failed for QuestionScreenCubits's hydration, json = $json",
        error,
        stacktrace,
      );
      rethrow;
    }
  }
}
