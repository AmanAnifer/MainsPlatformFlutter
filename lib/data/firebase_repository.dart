import 'package:http/http.dart';
// import 'dart:io';

import 'package:mains_platform/model/answer.dart';
import 'package:mains_platform/model/question.dart';
import 'package:mains_platform/model/userdata.dart';
import 'package:mains_platform/other/cog_logger.dart';
import 'question_repository.dart';
import 'dart:convert';
import 'package:mains_platform/other/constants.dart';

class FirebaseRepository implements QuestionsRepository {
  final Client httpClient;
  FirebaseRepository({required this.httpClient});

  @override
  Future addUser(
      {required String phoneNumber,
      required String email,
      required String fullName}) async {
    final userDataUrl =
        Uri.https(firebaseLink, firebaseUserDataEveryoneEndpoint);
    await httpClient.patch(
      userDataUrl,
      body: jsonEncode(
        {
          phoneNumber: {
            "fullname": fullName,
            "email": email,
          },
        },
      ),
    );
  }

  Future<List<Question>> _getAllQuestions() async {
    final url = Uri.https(firebaseLink, firebaseQuestionsEndpoint);
    final response = await httpClient.get(url);
    final asMap = jsonDecode(response.body);
    List<Question> result = [];
    for (Map<String, dynamic> i in asMap) {
      final question = Question.fromJson(i);
      result.add(question);
    }
    return result;
  }

  @override
  Future<List<Question>> getQuestions() async {
    return (await _getAllQuestions())
        .where(
          (element) => element.questionId != passwordHintKey,
        )
        .toList();
  }

  @override
  Future<String> getPasswordHint() async {
    return (await _getAllQuestions())
        .singleWhere(
          (element) => element.questionId == passwordHintKey,
        )
        .markdownQuestionString;
  }

  @override
  Future<String> getCorrectPassword() async {
    final url = Uri.https(firebaseLink, firebaseCorrectPasswordEndpoint);
    final response = jsonDecode((await httpClient.get(url)).body);
    return response as String;
  }

  @override
  Future<bool> canStartTest() async {
    final url = Uri.https(firebaseLink, firebaseStartTestEndpoint);
    final response = jsonDecode((await httpClient.get(url)).body);
    return response as bool;
  }

  @override
  Future submitAnswerForUser({
    required String userId,
    required Answer answer,
  }) async {
    final answersUrl =
        Uri.https(firebaseLink, firebaseAnswersEndpointForUser(userId));
    await httpClient.patch(
      answersUrl,
      body: jsonEncode(
        {
          answer.questionId: answer.answer,
        },
      ),
    );
  }

  @override
  Future setPasswordChallengeAsFinishedForUser({required String userId}) async {
    final url =
        Uri.https(firebaseLink, firebaseUserDataEndpointForUser(userId));
    final response = await httpClient.patch(
      url,
      body: jsonEncode(
        {
          passwordCompletedKey: true,
        },
      ),
    );
    getLogger().info("${response.statusCode}:${response.body}");
  }

  @override
  Future setTestFinishedForUser({required String userId}) async {
    final testFinishedurl = Uri.https(
      firebaseLink,
      firebaseUserDataEndpointForUser(userId),
    );
    await httpClient.patch(
      testFinishedurl,
      body: jsonEncode(
        {
          testCompletedKey: true,
        },
      ),
    );
  }

  @override
  Future<List<UserData>> adminGetAllUserData() async {
    final url = Uri.https(
      firebaseLink,
      firebaseUserDataEveryoneEndpoint,
    );
    final response = (await httpClient.get(url)).body;
    final decoded = jsonDecode(response);
    final Map<String, dynamic> responseMap = Map<String, dynamic>.from(
      decoded ?? {},
    );
    final List<UserData> userDataList = [];
    for (final userDataEntry in responseMap.entries) {
      userDataList.add(UserData.fromJsonEntry(userDataEntry));
    }
    return userDataList;
  }

  @override
  Future<void> adminSetCanStartTest({required bool shouldStartTest}) async {
    final startTestUrl = Uri.https(firebaseLink, firebaseStartTestEndpoint);

    await httpClient.put(startTestUrl, body: jsonEncode(shouldStartTest));
  }

  @override
  Future<Map<String, String>> adminGetAnswersOfUser(
      {required String userId}) async {
    final answersUrl =
        Uri.https(firebaseLink, firebaseAnswersEndpointForUser(userId));
    getLogger().info(answersUrl);
    final response = await httpClient.get(answersUrl);
    return Map<String, String>.from(jsonDecode(response.body) ?? {});
  }
}
