import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/hive/adapters.dart';
import 'package:alpha16/providers/counter_provider.dart';
import 'package:alpha16/providers/database_section_provider.dart';
import 'package:alpha16/providers/top_section_provider.dart';
import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DhirkAdapter());
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('es'),
      ],
      path: 'assets/langs/langs.csv',
      assetLoader: CsvAssetLoader(),
      fallbackLocale: const Locale('en'),
      child: const Alpha16(),
    ),
  );
}

class Alpha16 extends StatelessWidget {
  const Alpha16({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (context) => TopSectionProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseSectionProvider()),
      ],
      child: KeyedSubtree(
        key: ValueKey(context.locale),
        child: MaterialApp.router(
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
            ),
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
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
