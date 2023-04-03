import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proshore_even_manager_app/views/home_page.dart';
import 'package:proshore_even_manager_app/views/login_page.dart';
import 'package:proshore_even_manager_app/views/welcome_page.dart';

class AppRouteName {
  static const String splash = 'SplashPage';
  static const String login = 'LoginPage';
  static const String home = 'HomePage';


}

class AppRouter {
  late GoRouter router;

  AppRouter() {
    this.router = GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/s',
          name: AppRouteName.splash,
          pageBuilder: (context, state) {
            return MaterialPage(
              child: WelcomePage(),
            );
          },
        ),
        GoRoute(
          path: '/login',
          name: AppRouteName.login,
          builder: (context, state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: '/',
          name: AppRouteName.home,
          builder: (context, state) {
            return HomePage();
          },
        ),
      ],
    );
  }
}
