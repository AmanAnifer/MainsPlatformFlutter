import 'package:go_router/go_router.dart';
import 'package:mains_platform/view/view_barrel.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String welcomeScreen = "/welcome";
  static const String startFormScreen = "/startform";
  static const String passwordScreen = "/password";
  static const String _passwordScreenPath = "/password/:id";
  static const String questionScreen = "/question";
  static const String _questionScreenPath = "/question/:id/:isAdmin";
  static const String adminPanelScreen = "/adminpanel";
  static const String endScreen = "/endscreen";

  static final router = GoRouter(
    initialLocation: welcomeScreen,
    routes: [
      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: startFormScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 700),
          child: StartFormScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: _passwordScreenPath,
        name: passwordScreen,
        builder: (context, state) {
          return PasswordScreen(
            id: state.pathParameters["id"]!,
          );
        },
      ),
      GoRoute(
        name: questionScreen,
        path: _questionScreenPath,
        builder: (context, state) {
          return QuestionScreen(
            id: state.pathParameters["id"]!,
            isAdmin: bool.parse(
              state.pathParameters["isAdmin"] ?? "false",
            ),
          );
        },
      ),
      GoRoute(
        path: adminPanelScreen,
        builder: (context, state) => const AdminPanel(),
      ),
      GoRoute(
        path: endScreen,
        builder: (context, state) => const EndScreen(),
      ),
    ],
  );
}
