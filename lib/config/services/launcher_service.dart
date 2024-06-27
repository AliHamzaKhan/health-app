import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/app_print.dart';

class LauncherService {
  openLauncher({required LaunchType launchType}) {}

  Future<void> openMap(double latitude, double longitude,
      {LaunchMode linkLaunchMode = LaunchMode.externalApplication}) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl), mode: linkLaunchMode);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<void> launchMap(double latitude, double longitude) async {
    Uri uri;

    if (Platform.isAndroid) {
      uri = Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude');
    } else {
      uri = Uri.parse('comgooglemaps://?q=$latitude,$longitude');
    }

    final fallbackUri = Uri(
      scheme: "https",
      host: "maps.google.com",
      queryParameters: {'q': '$latitude, $longitude'},
    );

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await launchUrl(fallbackUri);
      }
    } catch (e) {
      await launchUrl(fallbackUri);
      appDebugPrint(e.toString());
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  launchMail(String mail) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mail,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Crescent Tracking From App',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  Future<void> makePhoneCall(String phone) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
  enum LaunchType { Map, Navigation, Phone }
