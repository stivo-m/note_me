import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchTargetUrls(String url) async {
  try {
    Uri uri = Uri.parse(url);
    await launchUrl(uri);
  } catch (e) {
    if (kDebugMode) {
      log('Unable to launch $url', error: e);
    }
  }
}
