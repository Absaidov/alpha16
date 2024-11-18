import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/providers/counter_provider.dart';
import 'package:alpha16/providers/database_section_provider.dart';
import 'package:alpha16/providers/top_section_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();

    return Visibility(
      visible: context.watch<TopSectionProvider>().activity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 24),
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => counterProvider.decrement(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blueLight,
                      ),
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/decrement.svg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => counterProvider.increment(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blue,
                      ),
                      width: 154,
                      height: 154,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          CurrentCounter(),
                          Text(
                            'Dhikr',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => counterProvider.zeroIng(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blueLight,
                      ),
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/Vector.svg'),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                myAlertDialog(
                  context: context,
                  title: 'Save Dhikr',
                  descriptionDhikr: 'Enter the title',
                  counter: counterProvider.counter,
                  delete: false,
                  onPressed:
                      context.read<DatabaseSectionProvider>().updateDatabase,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                height: 45,
                alignment: Alignment.center,
                child: Text(
                  'Save Dhikr',
                  style: TextStyle(
                    color: blue,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurrentCounter extends StatelessWidget {
  const CurrentCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Text(
      '${counterProvider.counter}',
      style: const TextStyle(
          fontSize: 48,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          height: 1.2),
    );
  }
}
