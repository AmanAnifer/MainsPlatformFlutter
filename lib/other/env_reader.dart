import 'package:dotenv/dotenv.dart';

abstract class EnvReader {
  String? getEnvVar(String key);
}

class EnvReaderDotenvFiles implements EnvReader {
  final List<String> envFiles;
  EnvReaderDotenvFiles({required this.envFiles});
  @override
  String? getEnvVar(String key) {
    final dotenv = DotEnv(includePlatformEnvironment: true);
    dotenv.load(envFiles);
    return dotenv[key];
    // if (dotenv.isDefined(key)) {
    //   return dotenv[key];
    // } else {
    //   return null;
    // }
  }
}
