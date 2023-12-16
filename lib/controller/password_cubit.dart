import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mains_platform/data/question_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mains_platform/other/cog_logger.dart';
part 'password_cubit.freezed.dart';
part 'password_cubit.g.dart';

@freezed
sealed class PasswordState with _$PasswordState {
  const factory PasswordState.initial() = PasswordInitial;
  const factory PasswordState.incomplete({
    required String passwordHint,
    @Default(false) bool isWrong,
  }) = PasswordIncomplete;
  const factory PasswordState.complete() = PasswordComplete;
  const factory PasswordState.error({
    required String error,
    required String stacktrace,
  }) = PasswordError;
  factory PasswordState.fromJson(Map<String, dynamic> json) =>
      _$PasswordStateFromJson(json);
}

class PasswordCubit extends HydratedCubit<PasswordState> {
  final String _id;
  final QuestionsRepository questionsRepository;
  PasswordCubit(
    this._id, {
    required this.questionsRepository,
  }) : super(const PasswordInitial()) {
    switch (state) {
      // This is done to prevent unwanted states when restore from hydration occurs,
      // since after restoring state from json, it executes the constructor
      case PasswordInitial():
        showPasswordHint();
      default:
        break;
    }
  }

  @override
  String get id => _id;

  /// This is a workaround for making HydratedCubit work since the state
  /// emitted by HydratedCubit is the first, it will not be detected by listeners,
  /// so instead, it is re emited so that listeners are notified
  Future<void> reEmit() async {
    await Future.delayed(
      Duration.zero,
      () {
        emit(state);
      },
    );
  }

  Future<void> showPasswordHint() async {
    try {
      final hint = await questionsRepository.getPasswordHint();
      emit(
        PasswordIncomplete(passwordHint: hint, isWrong: false),
      );
    } catch (error, stacktrace) {
      getLogger().severe(
          "Couldn't get password hint in showPasswordHint in PasswordCubit",
          error,
          stacktrace);
    }
  }

  Future<String> getCorrectPassword() async {
    return questionsRepository.getCorrectPassword();
  }

  Future<void> checkPassword(String enteredPassword) async {
    switch (state) {
      case PasswordIncomplete(:final passwordHint):
        try {
          final correctPassword = await getCorrectPassword();

          if (enteredPassword.trim().toLowerCase().split(" ").join("") ==
              correctPassword) {
            await updateFirebasePasswordProgress();
            emit(const PasswordComplete());
          } else {
            emit(PasswordIncomplete(isWrong: true, passwordHint: passwordHint));
          }
        } catch (error, stacktrace) {
          getLogger().severe(
            "Error while checking password in PasswordCubit",
            error,
            stacktrace,
          );
          emit(
            PasswordError(
              error: error.toString(),
              stacktrace: stacktrace.toString(),
            ),
          );
        }
      default:
        getLogger().warning("Tried to do checkPassword when state is $state");
    }
  }

  Future<void> updateFirebasePasswordProgress() async {
    try {
      questionsRepository.setPasswordChallengeAsFinishedForUser(userId: _id);
    } catch (error, stacktrace) {
      getLogger().severe(
        "Error on updateFirebasePasswordProgress in PasswordCubit",
        error,
        stacktrace,
      );
      emit(
        PasswordError(
          error: error.toString(),
          stacktrace: stacktrace.toString(),
        ),
      );
    }
  }

  @override
  PasswordState fromJson(Map<String, dynamic> json) {
    try {
      getLogger().info("Trying to restore PasswordState json=$json");
      final restoredState = PasswordState.fromJson(json);
      getLogger().info("Decoded PasswordState $restoredState");
      return restoredState;
    } catch (error, stacktrace) {
      getLogger().severe(
        "fromJson failed for PasswordCubit's hydration, json = $json",
        error,
        stacktrace,
      );
      rethrow;
    }
  }

  @override
  Map<String, dynamic> toJson(PasswordState state) {
    try {
      getLogger().info("Exporting PasswordState");
      return state.toJson();
    } catch (error, stacktrace) {
      getLogger().severe(
          "toJson failed for PasswordCubit's hydration", error, stacktrace);
      rethrow;
    }
  }
}
