import 'package:get_it/get_it.dart';
import 'package:mains_platform/data/firebase_repository.dart';
import 'package:http/http.dart';
import 'package:mains_platform/data/question_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final httpClient = Client();
  sl.registerSingleton<QuestionsRepository>(
    FirebaseRepository(
      httpClient: httpClient,
    ),
  );
}
