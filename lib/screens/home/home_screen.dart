import 'package:flutter/material.dart';

import 'counter_section.dart';
import 'database_section.dart';
import 'top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool activity = true;

  void toogleActivity(bool toogle) {
    if (toogle != activity) {
      setState(() => activity = toogle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffC7C7C7),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              TopSection(activity, toogleActivity),
              Visibility(visible: activity, child: const CounterSection()),
              DataBaseSection(),
            ],
          ),
        ),
      ),
    );
  }
}
