import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/models/dhikr.dart';
import 'package:alpha16/providers/counter_provider.dart';
import 'package:alpha16/providers/database_section_provider.dart';
import 'package:alpha16/providers/top_section_provider.dart';
import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const CurrentCounter(),
                          Text(
                            'Dhikr'.tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
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
                showDialog(
                  context: context,
                  builder: (context) {
                    final controller = TextEditingController();
                    return CupertinoAlertDialog(
                      title: Text('Save Dhikr'.tr()),
                      content: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text('${'Counter:'.tr()} ${counterProvider.counter}'),
                          const SizedBox(height: 10),
                          CupertinoTextField(
                            controller: controller,
                            placeholder: 'Enter title'.tr(),
                          ),
                          const SizedBox(height: 20),
                          FilledButton(
                              onPressed: () {
                                context
                                    .read<DatabaseSectionProvider>()
                                    .addDhikr(
                                      Dhikr(
                                        counterProvider.counter,
                                        controller.text,
                                        DateTime.now(),
                                      ),
                                    );
                                context.pop();
                                controller.dispose();
                              },
                              child: Text(
                                'Save'.tr(),
                                style: TextStyle(color: white),
                              )),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                height: 45,
                alignment: Alignment.center,
                child: Text(
                  'Save Dhikr'.tr(),
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
