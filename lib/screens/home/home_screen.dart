import 'package:flutter/material.dart';
import 'counter_section.dart';
import 'database_section.dart';
import 'top_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color(0xffC7C7C7),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              TopSection(),
              CounterSection(),
              DataBaseSection(),
            ],
          ),
        ),
      ),
    );
  }
}
