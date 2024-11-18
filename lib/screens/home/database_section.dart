import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/models/dhikr.dart';
// import 'package:alpha16/models/dhikr.dart';
import 'package:alpha16/providers/database_section_provider.dart';
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
            const Text(
              'Last saved Dhikrs',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 60,
              height: 2,
              margin: const EdgeInsets.only(top: 5, bottom: 20),
              color: blue,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dbProvider.fakeDB.length,
                itemBuilder: (context, index) {
                  //Инвертация индекса
                  index = dbProvider.fakeDB.length - 1 - index;
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
                              dbProvider.fakeDB[index].counter.toString(),
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
                          dbProvider.fakeDB[index].title,
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
                            DateFormat('dd.MM.yyyy')
                                .format(dbProvider.fakeDB[index].date),
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
                                final controller = TextEditingController();
                                return CupertinoAlertDialog(
                                  title: const Text('Edit Dhikr'),
                                  content: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Text(
                                          'Counter: ${dbProvider.fakeDB[index].counter}'),
                                      const SizedBox(height: 10),
                                      CupertinoTextField(
                                        controller: controller,
                                        placeholder:
                                            dbProvider.fakeDB[index].title,
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
                                                    dbProvider
                                                        .fakeDB[index].counter,
                                                    controller.text,
                                                    DateTime.now(),
                                                  ),
                                                );
                                                context.pop();
                                              },
                                              child: Text(
                                                'Save',
                                                style: TextStyle(color: white),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                dbProvider.removeDhikr(index);
                                                context.pop();
                                              },
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(color: red),
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: SvgPicture.asset('assets/icons/dots.svg')),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
