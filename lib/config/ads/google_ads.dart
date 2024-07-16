
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:health_app/utils/app_print.dart';

class MyGoogleAds {
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  List<String> testDeviceIds = <String>[];
  int maxFailedLoadAttempts = 3;

  // final String _androidInterstitialAdId = 'ca-app-pub-2347127270568674~3315289126';
  final String _androidInterstitialAdId = 'ca-app-pub-2347127270568674/4283474603';
  // final String _iosInterstitialAdId = 'ca-app-pub-2347127270568674~5206035421';
  final String _iosInterstitialAdId = 'ca-app-pub-2347127270568674/9577499046';
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  MyGoogleAds({List<String>? testDeviceIds}) {
    if (testDeviceIds != null) {
      this.testDeviceIds = testDeviceIds;
    }
    MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: testDeviceIds));
  }
  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? _androidInterstitialAdId
            : _iosInterstitialAdId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            appDebugPrint('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            appDebugPrint('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }
  void showInterstitialAd() {
    if (_interstitialAd == null) {
      appDebugPrint('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          appDebugPrint('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        appDebugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        appDebugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  close(){
    _interstitialAd?.dispose();
  }
}
