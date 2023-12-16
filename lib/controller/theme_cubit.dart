import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class ThemeState {
  final Color themeColor;
  ThemeState({required this.themeColor});
}

const colors = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  // Colors.amber,
  // Colors.blueAccent,
  Colors.deepPurple,
  Colors.brown,
  // Colors.deepOrangeAccent,
];

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeColor: getRandomDarkColor(),
          ),
        );

  static Color getRandomDarkColor() {
    final randIndex = math.Random().nextInt(colors.length);
    return colors[randIndex];
  }

  void changeThemeColor() {
    emit(
      ThemeState(
        themeColor: getRandomDarkColor(),
      ),
    );
  }
}
