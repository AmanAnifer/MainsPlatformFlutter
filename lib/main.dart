import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mains_platform/controller/theme_cubit.dart';
import 'package:mains_platform/other/routes.dart';
import 'package:mains_platform/other/strings.dart';
import 'controller/central_hive_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:window_manager/window_manager.dart';
import 'other/constants.dart';
import 'dart:io';
import 'other/cog_logger.dart';
import 'other/injection.dart' as injection;
// import 'package:yaru/yaru.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  await initLogger();
  if (!Platform.isAndroid) {
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.ensureInitialized();
      // Hide window title bar
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
      await windowManager.setFullScreen(true);
      // await windowManager.center();
      await windowManager.show();
      await windowManager.setSkipTaskbar(false);
    });
  }
  var path = (await getApplicationDocumentsDirectory()).path;
  path = p.join(path, hiveDirectoryName);
  var storagePath = Directory(path);
  await storagePath.create(recursive: true);
  final storage = await HydratedStorage.build(storageDirectory: storagePath);
  HydratedBloc.storage = storage;

  runApp(const MainsPlatformApp());
}

class MainsPlatformApp extends StatelessWidget {
  const MainsPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CentralHiveCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: Routes.router,
            debugShowCheckedModeBanner: false,
            title: nativeWindowTitle,
            // theme: yaruLight,
            // darkTheme: yaruDark,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ColorScheme.fromSeed(
                seedColor: state.themeColor,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ColorScheme.fromSeed(
                seedColor: state.themeColor,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }
}
