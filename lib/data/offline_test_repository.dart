import 'package:mains_platform/data/offline_md_questions.dart';
import 'package:mains_platform/model/userdata.dart';
import 'package:mains_platform/other/constants.dart';

import 'question_repository.dart';
import '../model/question.dart';
import '../model/answer.dart';

class OfflineTestQuestions implements QuestionsRepository {
  bool startTest = true;
  @override
  Future<List<Question>> getQuestions({
    bool includePasswordHintQuestion = false,
  }) async {
    List<Question> thing = [];
    for (final MapEntry(key: questionId, value: mdQuestion)
        in offlineMdQuestions.entries) {
      if (questionId != "passwordHint" || includePasswordHintQuestion) {
        thing.add(
          Question(
            questionId: questionId,
            markdownQuestionString: mdQuestion,
          ),
        );
      }
    }
    await Future.delayed(const Duration(seconds: 2));
    return thing;
  }

  @override
  Future<String> getPasswordHint() async {
    return offlineMdQuestions["passwordHint"] ?? "No password hint available";
  }

  @override
  Future<String> getCorrectPassword() async {
    return offlineTestingUserPassword;
  }

  @override
  Future addUser(
      {required String phoneNumber,
      required String email,
      required String fullName}) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<bool> canStartTest() async {
    await Future.delayed(const Duration(seconds: 1));
    startTest = !startTest;
    // It will first return false, then true, to simulate both scenarios
    return startTest;
  }

  @override
  Future submitAnswerForUser(
      {required String userId, required Answer answer}) async {
    await Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  Future setPasswordChallengeAsFinishedForUser({required String userId}) async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  @override
  Future setTestFinishedForUser({required String userId}) async {
    await Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  Future<List<UserData>> adminGetAllUserData() {
    // TODO: implement adminGetAllUserData
    throw UnimplementedError();
  }

  @override
  Future adminSetCanStartTest({required bool shouldStartTest}) {
    // TODO: implement adminSetCanStartTest
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> adminGetAnswersOfUser(
      {required String userId}) async {
    return {
      "question1": "What",
      "question3": "This is question number 3 dude",
    };
  }
}
