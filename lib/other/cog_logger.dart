import 'package:logging/logging.dart';
import 'constants.dart';
import 'dart:io';

Future<void> initLogger() async {
  Logger.root.level = Level.ALL;
  final logfile = File("./log.txt");
  final fileWrite = logfile.openWrite().writeln;
  Logger.root.onRecord.listen(
    (record) {
      String outputString =
          '${record.level.name}: ${record.time}: ${record.message}';
      if (record.stackTrace != null) {
        outputString +=
            ": Error ${record.error.runtimeType}: ${record.error}: ${record.stackTrace}";
      }
      fileWrite(outputString);
    },
  );
  Logger(loggerName);
}

Logger getLogger() {
  return Logger(loggerName);
}
