import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/models/dhikr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DataBaseSection extends StatelessWidget {
  const DataBaseSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: fakeDataBase.length,
                itemBuilder: (context, index) {
                  //Инвертация индекса
                  index = fakeDataBase.length - 1 - index;
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
                              fakeDataBase[index].counter.toString(),
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
                          fakeDataBase[index].title,
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
                                .format(fakeDataBase[index].date),
                            style: TextStyle(
                              fontSize: 10,
                              color: gray,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            myAlertDialog(
                              context: context,
                              title: 'Edit Dhikr',
                              descriptionDhikr: fakeDataBase[index].title,
                              counter: fakeDataBase[index].counter,
                              delete: true,
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

List<Dhikr> fakeDataBase = [
  Dhikr(123, 'title 1', DateTime.now()),
  Dhikr(234, 'title 2', DateTime.now()),
  Dhikr(546, 'title 3', DateTime.now()),
  Dhikr(789, 'title 4', DateTime.now()),
];
