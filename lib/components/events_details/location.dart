import 'package:url_launcher/url_launcher.dart';

_launchMaps(String location) async {
  String lat = location.split(' ')[0];
  String long = location.split(' ')[1];
  String googleUrl =
      'comgooglemaps://?center=${lat},${long}';
  String appleUrl =
      'https://maps.apple.com/?sll=${lat},${long}';
  if (await canLaunch("comgooglemaps://")) {
    print('launching com googleUrl');
    await launch(googleUrl);
  } else if (await canLaunch(appleUrl)) {
    print('launching apple url');
    await launch(appleUrl);
  } else {
    throw 'Could not launch url';
  }
}
