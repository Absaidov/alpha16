import 'package:alpha16/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CounterSection extends StatefulWidget {
  const CounterSection({super.key});

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  void zeroIng() {
    if (counter > 0) {
      setState(() {
        counter = 0;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // print('Подключится к БД');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // print('Отключится от БД');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('rebiuld');
    return Padding(
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
                  onTap: () => decrement(),
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
                  onTap: () => increment(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: blue,
                    ),
                    width: 154,
                    height: 154,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          '$counter',
                          style: const TextStyle(
                              fontSize: 48,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        ),
                        const Text(
                          'Dhikr',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => zeroIng(),
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            height: 45,
            alignment: Alignment.center,
            child: Text(
              'Save Dhikr',
              style: TextStyle(
                color: blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
