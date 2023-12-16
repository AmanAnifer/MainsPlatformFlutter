import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mains_platform/data/question_repository.dart';
import 'package:mains_platform/model/userdata.dart';
import 'package:mains_platform/other/cog_logger.dart';

sealed class AdminPanelState {}

class AdminPanelStateInitial implements AdminPanelState {}

class AdminPanelStateLoading implements AdminPanelState {}

class AdminPanelStateLoaded implements AdminPanelState {
  final List<UserData> userDataList;
  final bool isStarted;
  AdminPanelStateLoaded({
    required this.userDataList,
    required this.isStarted,
  });
}

class AdminPanelStateError implements AdminPanelState {
  String error;
  StackTrace stackTrace;
  AdminPanelStateError({
    required this.error,
    required this.stackTrace,
  });
}

class AdminPanelCubit extends Cubit<AdminPanelState> {
  final QuestionsRepository questionsRepository;
  AdminPanelCubit({
    required this.questionsRepository,
  }) : super(AdminPanelStateInitial()) {
    getUserData();
  }

  Future<void> getUserData() async {
    emit(AdminPanelStateLoading());
    try {
      final userDataList = await questionsRepository.adminGetAllUserData();
      final canStartTest = await questionsRepository.canStartTest();
      emit(
        AdminPanelStateLoaded(
          userDataList: userDataList,
          isStarted: canStartTest,
        ),
      );
    } catch (error, stacktrace) {
      getLogger()
          .severe("Error on getUserData in AdminPanelCubit", error, stacktrace);
      emit(AdminPanelStateError(
        error: error.toString(),
        stackTrace: stacktrace,
      ));
    }
  }

  Future<void> toggleStartExam() async {
    final previousState = state;
    emit(AdminPanelStateLoading());
    try {
      final currentTestState = await questionsRepository.canStartTest();
      final newTestState = !currentTestState;
      await questionsRepository.adminSetCanStartTest(
        shouldStartTest: newTestState,
      );
      List<UserData> list = [];
      switch (previousState) {
        case AdminPanelStateLoaded(:final userDataList):
          list = userDataList;
        default:
          break;
      }
      emit(
        AdminPanelStateLoaded(
          userDataList: list,
          isStarted: newTestState,
        ),
      );
    } catch (error, stacktrace) {
      getLogger().severe(
          "Error on toggleStartExam in AdminPanelCubit", error, stacktrace);
      emit(AdminPanelStateError(
        error: error.toString(),
        stackTrace: stacktrace,
      ));
    }
  }
}
