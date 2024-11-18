import 'package:alpha16/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              context.go('/');
            },
            title: const Text('Вернуться на Главную'),
          ),
          const ListTile(title: Text('data')),
          const ListTile(title: Text('data')),
          const ListTile(title: Text('data')),
          ListTile(
            onTap: () {
              context.read<CounterProvider>().increment();
            },
            title: const CurrentCounterInSettings(),
          ),
        ],
      ),
    );
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
