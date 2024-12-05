import 'dart:io';

import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/providers/top_section_provider.dart';
// import 'package:alpha16/screens/settings/setting_screen.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:alpha16/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final topSectionPtovider = context.watch<TopSectionProvider>();

    final activity = topSectionPtovider.activity;
    final toogleActivity = topSectionPtovider.toogleActivity;

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
                          'Activity'.tr(),
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
                              'Saved'.tr(),
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
          const ButtonSetting()
        ],
      ),
    );
  }
}

class ButtonSetting extends StatefulWidget {
  const ButtonSetting({
    super.key,
  });

  @override
  State<ButtonSetting> createState() => _ButtonSettingState();
}

class _ButtonSettingState extends State<ButtonSetting> {
  InterstitialAd? _interstitialAd;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  /// Loads an interstitial ad.
  void loadAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
              // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});
          // Keep a reference to the ad so you can show it later.
          _interstitialAd = ad;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');

          _interstitialAd?.dispose();
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    loadAd();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/settings');
        _interstitialAd?.show();
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
    );
  }
}
