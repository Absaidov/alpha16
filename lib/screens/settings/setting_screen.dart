import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          FilledButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Вернуться'),
          ),
          const Text('data'),
          const Text('data'),
          const Text('data'),
        ],
      ),
    );
  }
}
