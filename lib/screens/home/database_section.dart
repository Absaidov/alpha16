import 'package:alpha16/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                itemCount: 30,
                itemBuilder: (context, index) {
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
                              index.toString(),
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
                        const Expanded(
                            child: Text(
                          'Description Dhikr Description Dhikr Description Dhikr Description Dhikr',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.2,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            '20.10.2024',
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
                                return CupertinoAlertDialog(
                                  title: const Text('Edit Dhikr'),
                                  content: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      const Text('Counter: 33'),
                                      const SizedBox(height: 10),
                                      const CupertinoTextField(
                                        placeholder: 'Description Dhikr',
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FilledButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Save',
                                                style: TextStyle(color: white),
                                              )),
                                          TextButton(
                                              onPressed: () {},
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
