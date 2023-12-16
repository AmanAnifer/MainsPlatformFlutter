import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:path/path.dart' as p;
import 'package:mains_platform/other/env_reader.dart';

String dotEnvAssetPath =
    p.join(p.current, "data", "flutter_assets", "assets", ".env");
final EnvReader _envReader = EnvReaderDotenvFiles(envFiles: [dotEnvAssetPath]);
const String zephyrusVersionEnvKey = "COG_ZEPHYRUS_VERSION";
String zephyrusVersion = _envReader.getEnvVar(zephyrusVersionEnvKey) ?? "5";

const String feedbackFormLinkEnvKey = "COG_FEEDBACK_FORM_LINK";
String feedbackFormLink = _envReader.getEnvVar(feedbackFormLinkEnvKey)!;
const String loggerName = "cog_log";
const String adminCheatCode = "STARTADMIN";
const String adminUserName = "Admin Panel";
const String adminPassword = "Just Let Me In";
const String offlineTestingUserPassword = "heygeeks";
const String passwordHintKey = "passwordHint";
const String firebaseLinkEnvKey = "COG_FIREBASE_LINK";
final firebaseLink = _envReader.getEnvVar(firebaseLinkEnvKey)!; // default firebase link
const String firebaseStartTestEndpoint = "startTest.json";
const String firebaseQuestionsEndpoint = "questions.json";
String firebaseUserDataEndpointForUser(String id) => "user_data/$id.json";
String firebaseUserPasswordFinishedEndpoint(String id) => "user_data/$id/";
String firebaseAnswersEndpointForUser(String id) =>
    "user_data/$id/answers.json";
const String firebaseUserDataEveryoneEndpoint = "user_data.json";
const String firebaseCorrectPasswordEndpoint = "password.json";

const Color metaballGradiantStartColor = Color.fromARGB(255, 255, 136, 0);
const Color metaballGradiantEndColor = Color.fromARGB(255, 93, 6, 255);
String hiveDirectoryName = "zephyrus_${zephyrusVersion}_mains";
String getDbFolderForUser(String id) => "user_$id";

/// This is a helper for admin panel, a workaround to make Hydrated cubit not do its job (intentionally)
/// when its the admin who is looking, so that we always get the latest data
/// from the firebase instead of any cached data in hydrated storage
String getRandomIdForAdminViewOfUser(String id) =>
    "admin_${id}_${math.Random().nextInt(99999)}";
const String timerPasswordDurationEnvKey =
    "COG_PASSWORD_TIMER_DURATION_MINUTES";
const String timerQuestionDurationKey = "COG_QUESTION_TIMER_DURATION_MINUTES";
final timerPasswordDuration = Duration(
  minutes:
      int.tryParse(_envReader.getEnvVar(timerPasswordDurationEnvKey) ?? "10") ??
          10,
);
final timerQuestionDuration = Duration(
  minutes:
      int.tryParse(_envReader.getEnvVar(timerQuestionDurationKey) ?? "60") ??
          60,
);
const String pathParameterIdKey = "id";
const String pathParameterIsAdminKey = "isAdmin";
const String passwordCompletedKey = "passwordCompleted";
const String testCompletedKey = "isTestCompleted";
