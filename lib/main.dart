import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const Alpha16());
}

class Alpha16 extends StatelessWidget {
  const Alpha16({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: 'Gilroy',
          scaffoldBackgroundColor: grayBG,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: blue,
            onPrimary: black,
            secondary: black,
            onSecondary: black,
            error: red,
            onError: red,
            surface: white,
            onSurface: black,
          )),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingScreen(),
        ),
      ],
    ),
  ],
);
