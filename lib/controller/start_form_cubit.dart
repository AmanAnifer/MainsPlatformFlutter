import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mains_platform/data/question_repository.dart';
import 'package:mains_platform/other/cog_logger.dart';

class StartFormState {
  String? phoneNumber;
  String? fullName;
  String? email;
  StartFormState({this.phoneNumber, this.fullName, this.email});
}

class StartFormCubit extends Cubit<StartFormState> {
  final QuestionsRepository questionsRepository;
  StartFormCubit({
    required this.questionsRepository,
  }) : super(StartFormState());

  Future<void> setUserDetail(Box box, String inputPhoneNumber,
      String inputFullName, String inputEmail) async {
    box.putAll({
      "phone_number": inputPhoneNumber,
      "full_name": inputFullName,
      "email": inputEmail
    });
    try {
      await questionsRepository.addUser(
        phoneNumber: inputPhoneNumber,
        email: inputEmail,
        fullName: inputFullName,
      );
    } catch (error, stacktrace) {
      getLogger().severe(
        "Error on setUserDetail in StartFormCubit",
        error,
        stacktrace,
      );
    }
    emit(StartFormState(
        phoneNumber: inputPhoneNumber,
        fullName: inputFullName,
        email: inputEmail));
  }
}
