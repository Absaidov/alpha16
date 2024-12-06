import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/main.dart';
import 'package:alpha16/providers/counter_provider.dart';
import 'package:alpha16/providers/database_section_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langs = context.supportedLocales;

    return FutureBuilder(
        future: setUpRemoteConfig(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          } else {
            Color color = blue;
            switch (snapshot.data?.getString('color_settings_page')) {
              case 'gray':
                color = gray;
              case 'black':
                color = black;
              case 'blue':
                color = blue;
              case 'blueLight':
                color = blueLight;
              case 'grayBG':
                color = grayBG;
            }
            return Scaffold(
              backgroundColor: color,
              appBar: AppBar(
                title: Text('Settings'.tr()),
              ),
              body: Column(
                children: [
                  ListTile(
                    onTap: () {
                      context.go('/');
                    },
                    title: Text('Go back to Home Page'.tr()),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<CounterProvider>().increment();
                    },
                    title: const CurrentCounterInSettings(),
                  ),
                  ListTile(
                    title: Text('Language'.tr()),
                    trailing: FilledButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Select language'.tr()),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(langs.length, (index) {
                                  final lang = langs[index].toString();

                                  return ListTile(
                                    onTap: () {
                                      context
                                        ..setLocale(langs[index])
                                        ..pop()
                                        ..go('/');
                                    },
                                    title:
                                        Text(langsMap[lang]?.tr() ?? 'error'),
                                  );
                                }),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        langsMap[context.locale.toString()] ?? 'error',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: context
                          .read<DatabaseSectionProvider>()
                          .box
                          .listenable(),
                      builder: (context, snapshot, _) {
                        return Expanded(
                            child: ListView.builder(
                          itemCount: snapshot.length,
                          itemBuilder: (context, index) {
                            return Text(snapshot.getAt(index)?.title ?? '');
                          },
                        ));
                      })
                ],
              ),
            );
          }
        });
  }
}

class CurrentCounterInSettings extends StatelessWidget {
  const CurrentCounterInSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CounterProvider>().counter.toString(),
    );
  }
}
