import 'dart:convert';
import 'dart:io';
import '../../data/offline_test_repository.dart';

void main() async {
  final offlineTestQuestions = OfflineTestQuestions();

  var file = File("./firebase/import_this_to_firebase.json");

  var jsonQuestions = jsonEncode(
    {
      "questions": await offlineTestQuestions.getQuestions(
        includePasswordHintQuestion: true,
      ),
      "password": await offlineTestQuestions.getCorrectPassword(),
      "startTest": false,
      "user_data": {},
    },
  );
  file.writeAsStringSync(jsonQuestions);
}
