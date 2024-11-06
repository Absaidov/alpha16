import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/main.dart';
import 'package:alpha16/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../settings/setting_screen.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final getHomeState = context.findAncestorStateOfType<HomeScreenState>();
    final activity = getHomeState?.activity ?? true;
    final toogleActivity = getHomeState!.toogleActivity;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => toogleActivity(true),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: activity ? blue : white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        height: 30,
                        child: Text(
                          'Activity',
                          style: TextStyle(
                            color: activity ? white : gray,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => toogleActivity(false),
                        child: Container(
                            decoration: BoxDecoration(
                              color: activity ? white : blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              'Saved',
                              style: TextStyle(
                                color: activity ? gray : white,
                                fontSize: 12,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go('/settings');
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 54,
              height: 38,
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/menu.svg'),
            ),
          )
        ],
      ),
    );
  }
}
