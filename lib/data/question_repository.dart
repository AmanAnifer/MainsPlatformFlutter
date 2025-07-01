import 'package:mains_platform/model/answer.dart';
import 'package:mains_platform/model/userdata.dart';

import '../model/question.dart';

abstract class QuestionsRepository {
  Future<dynamic> addUser({
    required String phoneNumber,
    required String email,
    required String fullName,
  });
  Future<List<Question>> getQuestions();
  Future<String> getPasswordHint();
  Future<String> getCorrectPassword();
  Future<bool> canStartTest();
  Future<dynamic> setPasswordChallengeAsFinishedForUser({
    required String userId,
  });
  Future<dynamic> submitAnswerForUser({
    required String userId,
    required Answer answer,
  });
  Future<dynamic> setTestFinishedForUser({
    required String userId,
  });
  Future<List<UserData>> adminGetAllUserData();
  Future<dynamic> adminSetCanStartTest({
    required bool shouldStartTest,
  });
  Future<Map<String, String>> adminGetAnswersOfUser({required String userId});
}
