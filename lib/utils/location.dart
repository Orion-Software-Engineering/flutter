import 'package:url_launcher/url_launcher.dart';

///-------------------Detect Maps on device and launch--------------------
void launchMaps(String location) async {
  if (location.split(' ').isEmpty) location = "6.6817115 -1.5752673";
  print(location);
  String lat = location.split(' ')[0];
  String long = location.split(' ')[1];
  String googleUrl = 'comgooglemaps://?center=$lat,$long';
  String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
  launchUrl(Uri.parse("https://maps.google.com/maps?daddr=$lat,$long"));
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
