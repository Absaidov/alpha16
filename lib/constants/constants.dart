import 'package:alpha16/models/dhikr.dart';
import 'package:alpha16/screens/home/database_section.dart';
import 'package:alpha16/screens/home/home_screen.dart';
import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Color blue = const Color(0xff4664FF);
Color blueLight = const Color(0xff778DFF);
Color gray = const Color(0xff9F9F9F);
Color grayLight = const Color(0xffF9F9F9);
Color grayBG = const Color(0xffC7C7C7);
Color black = const Color(0xff232323);

Color red = const Color(0xFFFF0000);
Color white = const Color(0xffFFFFFF);

void myAlertDialog({
  required BuildContext context,
  required String title,
  required String descriptionDhikr,
  required int counter,
  required bool delete,
  Function? mySetState,
}) {
  showDialog(
    context: context,
    builder: (context) {
      final controller = TextEditingController();
      return CupertinoAlertDialog(
        title: Text(title),
        content: Column(
          children: [
            const SizedBox(height: 20),
            Text('Counter: $counter'),
            const SizedBox(height: 10),
            CupertinoTextField(
              controller: controller,
              placeholder: descriptionDhikr,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                    onPressed: () {
                      fakeDataBase
                          .add(Dhikr(counter, controller.text, DateTime.now()));
                      if (mySetState != null) {
                        mySetState();
                      }
                      context.pop();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: white),
                    )),
                Visibility(
                  visible: delete,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(color: red),
                      )),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
