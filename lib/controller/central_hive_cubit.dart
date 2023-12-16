import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CentralHiveCubit extends Cubit<Box?> {
  // Box? hydratedBox;
  CentralHiveCubit() : super(null);

  Future<void> connectHiveWithId(String phoneNumber) async {
    Directory storagePath;
    var path = (await getApplicationDocumentsDirectory()).path;
    // var path = (await getApplicationDocumentsDirectory()).path;
    path = p.join(path, hiveDirectoryName, getDbFolderForUser(phoneNumber));
    // path = p.join(path, "mains_platform");
    storagePath = Directory(path);
    storagePath = await storagePath.create(recursive: true);
    await Hive.initFlutter(storagePath.path);
    var box = await Hive.openBox(phoneNumber);

    emit(box);
  }
}
