import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/models/dhikr.dart';
// import 'package:alpha16/models/dhikr.dart';
import 'package:alpha16/providers/database_section_provider.dart';
// import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:flutter/cupertino.dart';
// import 'package:alpha16/screens/home/counter_section.dart';
// import 'package:alpha16/screens/home/top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DataBaseSection extends StatelessWidget {
  const DataBaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = context.watch<DatabaseSectionProvider>();
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last saved Dhikrs'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 60,
              height: 2,
              margin: const EdgeInsets.only(top: 5, bottom: 20),
              color: blue,
            ),
            Expanded(
              child: FutureBuilder(
                  future:
                      context.read<DatabaseSectionProvider>().openDhikrBox(),
                  builder: (
                    context,
                    snapshot,
                  ) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else {
                      final box = context.read<DatabaseSectionProvider>().box;
                      return ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          //Инвертация индекса
                          index = box.length - 1 - index;
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: grayLight,
                            ),
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60,
                                    alignment: Alignment.center,
                                    child: Text(
                                      box.getAt(index)?.counter.toString() ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: blue,
                                      ),
                                    )),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: white,
                                  margin: const EdgeInsets.only(right: 20),
                                ),
                                Expanded(
                                    child: Text(
                                  box.getAt(index)?.title ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    height: 1.2,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    DateFormat('dd.MM.yyyy').format(
                                      box.getAt(index)?.date ?? DateTime.now(),
                                    ),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: gray,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        final controller =
                                            TextEditingController();
                                        return CupertinoAlertDialog(
                                          title: Text('Edit Dhikr'.tr()),
                                          content: Column(
                                            children: [
                                              const SizedBox(height: 20),
                                              Text(
                                                  '${'Counter:'.tr()} ${box.getAt(index)?.counter}'),
                                              const SizedBox(height: 10),
                                              CupertinoTextField(
                                                controller: controller,
                                                placeholder:
                                                    box.getAt(index)?.title,
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FilledButton(
                                                      onPressed: () {
                                                        dbProvider.updateDhikr(
                                                          index,
                                                          Dhikr(
                                                            box
                                                                    .getAt(
                                                                        index)
                                                                    ?.counter ??
                                                                0,
                                                            controller.text,
                                                            DateTime.now(),
                                                          ),
                                                        );
                                                        context.pop();
                                                      },
                                                      child: Text(
                                                        'Save'.tr(),
                                                        style: TextStyle(
                                                            color: white),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        dbProvider
                                                            .removeDhikr(index);
                                                        context.pop();
                                                      },
                                                      child: Text(
                                                        'Delete'.tr(),
                                                        style: TextStyle(
                                                            color: red),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SvgPicture.asset(
                                          'assets/icons/dots.svg')),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
