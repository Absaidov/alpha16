// import 'package:alpha16/models/dhikr.dart';
// import 'package:alpha16/screens/home/database_section.dart';
// import 'package:alpha16/screens/home/home_screen.dart';
// import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

Color blue = const Color(0xff4664FF);
Color blueLight = const Color(0xff778DFF);
Color gray = const Color(0xff9F9F9F);
Color grayLight = const Color(0xffF9F9F9);
Color grayBG = const Color(0xffC7C7C7);
Color black = const Color(0xff232323);

Color red = const Color(0xFFFF0000);
Color white = const Color(0xffFFFFFF);

const Map<String, String> langsMap = {
  'en': 'English',
  'es': 'Spanish',
  'ru': 'Русский',
};

Future<FirebaseRemoteConfig> setUpRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.setDefaults(const {
    "color_settings_page": "blue",
    // "example_param_2": 3.14159,
    // "example_param_3": true,
    // "example_param_4": "Hello, world!",
  });

  await remoteConfig.fetchAndActivate();

  return remoteConfig;
}
